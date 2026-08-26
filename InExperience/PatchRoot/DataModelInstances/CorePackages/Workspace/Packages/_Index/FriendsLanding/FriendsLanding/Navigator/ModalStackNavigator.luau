local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local _ = friendsLanding.Parent
local roactNavigation = dependenciesModule.RoactNavigation
local enumScreensModule = require(friendsLanding.EnumScreens)
local mainStackNavigatorConnectorModule = require(friendsLanding.Navigator.MainStackNavigatorConnector)
local friendsLandingFilterModule = require(friendsLanding.Components.FriendsLandingFilter)
local friendsLandingContextualMenuModule = require(friendsLanding.Components.FriendsLandingContextualMenu)
local discoverabilityOverlay = dependenciesModule.DiscoverabilityOverlay
local roact = dependenciesModule.Roact
local _ = require(friendsLanding.Parent.React)
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local profileQRCodePageWrapperModule = require(friendsLanding.Navigator.ProfileQRCodePageWrapper)

roact.PureComponent:extend("DiscoverabilityWrapped").render = function(p1)
	-- upvalues: friendsLandingContextModule (ref), roact (ref), discoverabilityOverlay (ref)
	return friendsLandingContextModule.with(function(p2)
		-- upvalues: roact (copy), discoverabilityOverlay (copy), p1 (ref)
		return roact.createElement(discoverabilityOverlay, { navigation = p1.props.navigation, context = p2 })
	end)
end

return roactNavigation.createRobloxStackNavigator({
	{
		MainStackNavigator = {
			screen = mainStackNavigatorConnectorModule,
			navigationOptions = { overlayTransparency = 1 }
		}
	},
	{
		[enumScreensModule.FilterByModal] = { screen = friendsLandingFilterModule }
	},
	{
		[enumScreensModule.ContextualMenu] = friendsLandingContextualMenuModule
	},
	{
		[enumScreensModule.ProfileQRCodePage] = profileQRCodePageWrapperModule
	}
}, {
	defaultNavigationOptions = {
		overlayEnabled = true,
		absorbInput = true,
		absorbInputSelectable = false
	},
	mode = roactNavigation.StackPresentationStyle.Overlay
})