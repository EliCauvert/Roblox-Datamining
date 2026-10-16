local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local _ = FriendsLanding.Parent
local RoactNavigation = DependenciesModule.RoactNavigation
local EnumScreensModule = require(FriendsLanding.EnumScreens)
local MainStackNavigatorConnectorModule = require(FriendsLanding.Navigator.MainStackNavigatorConnector)
local FriendsLandingFilterModule = require(FriendsLanding.Components.FriendsLandingFilter)
local FriendsLandingContextualMenuModule = require(FriendsLanding.Components.FriendsLandingContextualMenu)
local DiscoverabilityOverlay = DependenciesModule.DiscoverabilityOverlay
local Roact = DependenciesModule.Roact
local _ = require(FriendsLanding.Parent.React)
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local ProfileQRCodePageWrapperModule = require(FriendsLanding.Navigator.ProfileQRCodePageWrapper)

Roact.PureComponent:extend("DiscoverabilityWrapped").render = function(p1) --[[ Line: 18 | Named "render" ]]
	-- upvalues: FriendsLandingContextModule (copy), Roact (copy), DiscoverabilityOverlay (copy)
	return FriendsLandingContextModule.with(function(Context) --[[ Line: 19 ]]
		-- upvalues: Roact (upval), DiscoverabilityOverlay (upval), p1 (copy)
		return Roact.createElement(DiscoverabilityOverlay, { navigation = p1.props.navigation, context = Context })
	end)
end

return (RoactNavigation.createRobloxStackNavigator({
	{
		MainStackNavigator = {
			screen = MainStackNavigatorConnectorModule,
			navigationOptions = { overlayTransparency = 1 }
		}
	},
	{
		[EnumScreensModule.FilterByModal] = { screen = FriendsLandingFilterModule }
	},
	{
		[EnumScreensModule.ContextualMenu] = FriendsLandingContextualMenuModule
	},
	{
		[EnumScreensModule.ProfileQRCodePage] = ProfileQRCodePageWrapperModule
	}
}, {
	defaultNavigationOptions = {
		overlayEnabled = true,
		absorbInput = true,
		absorbInputSelectable = false
	},
	mode = RoactNavigation.StackPresentationStyle.Overlay
}))