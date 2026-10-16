local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local EnumScreensModule = require(FriendsLanding.EnumScreens)
local FriendsLandingAnalyticsModule = require(FriendsLanding.FriendsLandingAnalytics)
local AddFriendsIconModule = require(FriendsLanding.Components.AddFriendsIcon)
local MemoizeFunction = DependenciesModule.memoize
local IconButton = UIBlox.App.Button.IconButton
local Images = UIBlox.App.ImageSet.Images
local ButtonClickEventsModule = require(FriendsLanding.FriendsLandingAnalytics.ButtonClickEvents)
local ComposeFunction = DependenciesModule.SocialLibraries.RoduxTools.compose
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagConnectionManagementChips = require(Parent.SharedFlags).FFlagConnectionManagementChips

local function v15(p1) --[[ Line: 27 ]]
	-- upvalues: Roact (copy), IconButton (copy), Images (copy)
	return Roact.createElement(IconButton, {
		size = UDim2.fromOffset(0, 0),
		icon = Images["icons/common/search"],
		layoutOrder = p1.layoutOrder,
		onActivated = p1.goToSearchFriendsPage
	})
end

local config = {
	SHOW_ADDFRIENDS_ICON = {
		[EnumScreensModule.FriendsLanding] = true,
		[EnumScreensModule.SearchFriends] = true
	},
	SHOW_SEARCHFRIENDS_ICON = {
		[EnumScreensModule.FriendsLanding] = true,
		[EnumScreensModule.SearchFriends] = true,
		[EnumScreensModule.AddFriends] = true
	}
}
local HeaderBarRightView = Roact.PureComponent:extend("HeaderBarRightView")
HeaderBarRightView.defaultProps = { layoutOrder = 1, onActivated = nil }

function HeaderBarRightView.init(p1) --[[ Line: 55 ]]
	-- upvalues: MemoizeFunction (copy), ButtonClickEventsModule (copy), EnumScreensModule (copy), AppPage (copy), Sources (copy)
	p1.goToFriendRequestsPage = MemoizeFunction(function(_, p2) --[[ Line: 57 ]]
		-- upvalues: ButtonClickEventsModule (upval), p1 (copy), EnumScreensModule (upval), AppPage (upval)
		return function() --[[ Line: 58 ]]
			-- upvalues: p2 (copy), ButtonClickEventsModule (upval), p1 (upval), EnumScreensModule (upval), AppPage (upval)
			p1.props.analytics:buttonClick(p2 == 0 and ButtonClickEventsModule.AddFriendsNoFriends or ButtonClickEventsModule.AddFriends)
			p1.props.analytics:navigate(EnumScreensModule.AddFriends)
			
			return p1.props.navigation.navigate(AppPage.AddFriendsPage)
		end
	end)
	p1.goToSearchFriendsPage = MemoizeFunction(function() --[[ Line: 68 ]]
		-- upvalues: p1 (copy), AppPage (upval), Sources (upval)
		return function() --[[ Line: 69 ]]
			-- upvalues: p1 (upval), AppPage (upval), Sources (upval)
			p1.props.navigation.navigate(AppPage.UserSearch, {
				shouldShowUserSearchLandingPage = true,
				entryPoint = Sources.FriendsLanding
			})
		end
	end)
end

function HeaderBarRightView.render(p1) --[[ Line: 78 ]]
	-- upvalues: config (copy), EnumScreensModule (copy), Roact (copy), v15 (copy), AddFriendsIconModule (copy), FFlagConnectionManagementChips (copy)
	local Navigation = p1.props.navigation
	local SHOWSEARCHFRIENDSICONEntry = nil
	local SHOWADDFRIENDSICONEntry = nil
	
	if p1.props.addFriendsPageSearchbarEnabled then
		config.SHOW_ADDFRIENDS_ICON[EnumScreensModule.SearchFriends] = false
	end
	if Navigation and Navigation.state then
		local RouteName = Navigation.state.routeName
		SHOWSEARCHFRIENDSICONEntry = config.SHOW_SEARCHFRIENDS_ICON[RouteName]
		SHOWADDFRIENDSICONEntry = config.SHOW_ADDFRIENDS_ICON[RouteName]
	end
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 72, 0, 36)
	}, {
		UIListLayout = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		SearchFriendsIcon = SHOWSEARCHFRIENDSICONEntry and v15({
			layoutOrder = 1,
			goToSearchFriendsPage = p1.goToSearchFriendsPage()
		}),
		Padding = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		AddFriendsIcon = SHOWADDFRIENDSICONEntry and Roact.createElement(AddFriendsIconModule, {
			layoutOrder = 3,
			onActivated = p1.goToFriendRequestsPage(p1.props.navigateToLuaAppPages, p1.props.totalFriendCount),
			friendRequestCount = p1.props.friendRequestCount,
			showTooltip = not FFlagConnectionManagementChips and p1.props.totalFriendCount == 0
		})
	})
end

return ComposeFunction(FriendsLandingAnalyticsModule.connect(function(Analytics) --[[ Line: 121 ]]
	return { analytics = Analytics }
end), FriendsLandingContextModule.connect(function(p1, _) --[[ Line: 126 ]]
	return {
		navigateToLuaAppPages = p1.navigateToLuaAppPages,
		friendRequestCount = p1.friendRequestCount,
		totalFriendCount = p1.totalFriendCount,
		luaAddFriendsPageEnabled = p1.luaAddFriendsPageEnabled,
		addFriendsPageSearchbarEnabled = p1.addFriendsPageSearchbarEnabled
	}
end))(HeaderBarRightView)