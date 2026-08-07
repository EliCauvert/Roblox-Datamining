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

local var7 = function(p0) --[[ line: 27 ]]
	-- upvalues: roact (ref), iconButton (ref), images (ref)
	return roact.createElement(iconButton, {
		size = UDim2.fromOffset(0, 0),
		icon = images["icons/common/search"],
		layoutOrder = p0.layoutOrder,
		onActivated = p0.goToSearchFriendsPage
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

function headerBarRightView.init(p1) --[[ line: 55 ]]
	-- upvalues: memoize (ref), buttonClickEventsModule (ref), enumScreensModule (ref), appPage (ref), sources (ref)
	p1.goToFriendRequestsPage = memoize(function(_, p2) --[[ line: 57 ]]
		-- upvalues: buttonClickEventsModule (copy), p1 (ref), enumScreensModule (copy), appPage (copy)
		return function() --[[ line: 58 ]]
			-- upvalues: p2 (ref), buttonClickEventsModule (copy), p1 (copy), enumScreensModule (copy), appPage (copy)
			p1.props.analytics:buttonClick(if p2 == 0 then buttonClickEventsModule.AddFriendsNoFriends else buttonClickEventsModule.AddFriends)
			p1.props.analytics:navigate(enumScreensModule.AddFriends)
			
			return p1.props.navigation.navigate(appPage.AddFriendsPage)
		end
	end)
	p1.goToSearchFriendsPage = memoize(function() --[[ line: 68 ]]
		-- upvalues: p1 (ref), appPage (copy), sources (copy)
		return function() --[[ line: 69 ]]
			-- upvalues: p1 (copy), appPage (copy), sources (copy)
			p1.props.navigation.navigate(appPage.UserSearch, {
				shouldShowUserSearchLandingPage = true,
				entryPoint = sources.FriendsLanding
			})
		end
	end)
end

function headerBarRightView.render(p3) --[[ line: 78 ]]
	-- upvalues: t (ref), enumScreensModule (ref), roact (ref), var7 (ref), addFriendsIconModule (ref), fFlagConnectionManagementChips (ref)
	local navigation = p3.props.navigation
	local var10 = nil
	local var11 = nil
	
	if p3.props.addFriendsPageSearchbarEnabled then
		t.SHOW_ADDFRIENDS_ICON[enumScreensModule.SearchFriends] = false
	end
	if navigation and navigation.state then
		local routeName = navigation.state.routeName
		var10 = t.SHOW_SEARCHFRIENDS_ICON[routeName]
		var11 = t.SHOW_ADDFRIENDS_ICON[routeName]
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
		SearchFriendsIcon = var10 and var7({
			layoutOrder = 1,
			goToSearchFriendsPage = p3.goToSearchFriendsPage()
		}),
		Padding = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		AddFriendsIcon = var11 and roact.createElement(addFriendsIconModule, {
			layoutOrder = 3,
			onActivated = p3.goToFriendRequestsPage(p3.props.navigateToLuaAppPages, p3.props.totalFriendCount),
			friendRequestCount = p3.props.friendRequestCount,
			showTooltip = if fFlagConnectionManagementChips then false else p3.props.totalFriendCount == 0
		})
	})
end

return compose(friendsLandingAnalyticsModule.connect(function(p4) --[[ line: 121 ]]
	return { analytics = p4 }
end), friendsLandingContextModule.connect(function(p5, _) --[[ line: 126 ]]
	return {
		navigateToLuaAppPages = p5.navigateToLuaAppPages,
		friendRequestCount = p5.friendRequestCount,
		totalFriendCount = p5.totalFriendCount,
		luaAddFriendsPageEnabled = p5.luaAddFriendsPageEnabled,
		addFriendsPageSearchbarEnabled = p5.addFriendsPageSearchbarEnabled
	}
end))(headerBarRightView)