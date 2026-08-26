local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local parent = friendsLanding.Parent
local dependenciesModule = require(friendsLanding.dependencies)
local socialLibraries = dependenciesModule.SocialLibraries
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local enumScreensModule = require(friendsLanding.EnumScreens)
local friendsLandingAnalyticsModule = require(friendsLanding.FriendsLandingAnalytics)
local addFriendsIconModule = require(friendsLanding.Components.AddFriendsIcon)
local memoize = dependenciesModule.memoize
local iconButton = UIBlox.App.Button.IconButton
local images = UIBlox.App.ImageSet.Images
local buttonClickEventsModule = require(friendsLanding.FriendsLandingAnalytics.ButtonClickEvents)
local compose = socialLibraries.RoduxTools.compose
local sources = require(parent.SocialLuaAnalytics).Analytics.Enums.Sources
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagConnectionManagementChips = require(parent.SharedFlags).FFlagConnectionManagementChips

local var1 = function(p1)
	-- upvalues: roact (ref), iconButton (ref), images (ref)
	return roact.createElement(iconButton, {
		size = UDim2.fromOffset(0, 0),
		icon = images["icons/common/search"],
		layoutOrder = p1.layoutOrder,
		onActivated = p1.goToSearchFriendsPage
	})
end

local t = {
	SHOW_ADDFRIENDS_ICON = {
		[enumScreensModule.FriendsLanding] = true,
		[enumScreensModule.SearchFriends] = true
	},
	SHOW_SEARCHFRIENDS_ICON = {
		[enumScreensModule.FriendsLanding] = true,
		[enumScreensModule.SearchFriends] = true,
		[enumScreensModule.AddFriends] = true
	}
}
local headerBarRightView = roact.PureComponent:extend("HeaderBarRightView")
headerBarRightView.defaultProps = { layoutOrder = 1, onActivated = nil }

function headerBarRightView.init(p1)
	-- upvalues: memoize (ref), buttonClickEventsModule (ref), enumScreensModule (ref), appPage (ref), sources (ref)
	p1.goToFriendRequestsPage = memoize(function(_, p2)
		-- upvalues: buttonClickEventsModule (copy), p1 (ref), enumScreensModule (copy), appPage (copy)
		return function()
			-- upvalues: p2 (ref), buttonClickEventsModule (copy), p1 (copy), enumScreensModule (copy), appPage (copy)
			p1.props.analytics:buttonClick(if p2 == 0 then buttonClickEventsModule.AddFriendsNoFriends else buttonClickEventsModule.AddFriends)
			p1.props.analytics:navigate(enumScreensModule.AddFriends)
			
			return p1.props.navigation.navigate(appPage.AddFriendsPage)
		end
	end)
	p1.goToSearchFriendsPage = memoize(function()
		-- upvalues: p1 (ref), appPage (copy), sources (copy)
		return function()
			-- upvalues: p1 (copy), appPage (copy), sources (copy)
			p1.props.navigation.navigate(appPage.UserSearch, {
				shouldShowUserSearchLandingPage = true,
				entryPoint = sources.FriendsLanding
			})
		end
	end)
end

function headerBarRightView.render(p1)
	-- upvalues: t (ref), enumScreensModule (ref), roact (ref), var1 (ref), addFriendsIconModule (ref), fFlagConnectionManagementChips (ref)
	local navigation = p1.props.navigation
	local var2 = nil
	local var3 = nil
	
	if p1.props.addFriendsPageSearchbarEnabled then
		t.SHOW_ADDFRIENDS_ICON[enumScreensModule.SearchFriends] = false
	end
	if navigation and navigation.state then
		local routeName = navigation.state.routeName
		var2 = t.SHOW_SEARCHFRIENDS_ICON[routeName]
		var3 = t.SHOW_ADDFRIENDS_ICON[routeName]
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 72, 0, 36)
	}, {
		UIListLayout = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		SearchFriendsIcon = var2 and var1({
			layoutOrder = 1,
			goToSearchFriendsPage = p1.goToSearchFriendsPage()
		}),
		Padding = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		AddFriendsIcon = var3 and roact.createElement(addFriendsIconModule, {
			layoutOrder = 3,
			onActivated = p1.goToFriendRequestsPage(p1.props.navigateToLuaAppPages, p1.props.totalFriendCount),
			friendRequestCount = p1.props.friendRequestCount,
			showTooltip = if fFlagConnectionManagementChips then false else p1.props.totalFriendCount == 0
		})
	})
end

return compose(friendsLandingAnalyticsModule.connect(function(p1)
	return { analytics = p1 }
end), friendsLandingContextModule.connect(function(p1, _)
	return {
		navigateToLuaAppPages = p1.navigateToLuaAppPages,
		friendRequestCount = p1.friendRequestCount,
		totalFriendCount = p1.totalFriendCount,
		luaAddFriendsPageEnabled = p1.luaAddFriendsPageEnabled,
		addFriendsPageSearchbarEnabled = p1.addFriendsPageSearchbarEnabled
	}
end))(headerBarRightView)