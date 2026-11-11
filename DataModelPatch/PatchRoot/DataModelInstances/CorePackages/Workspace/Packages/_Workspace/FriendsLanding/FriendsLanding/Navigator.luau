local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local RoactNavigation = DependenciesModule.RoactNavigation

return (RoactNavigation.createRobloxStackNavigator({
	{
		ModalStackNavigator = {
			screen = require(FriendsLanding.Navigator.ModalStackNavigator),
			navigationOptions = { transparent = true, absorbInputSelectable = false }
		}
	},
	{
		[require(FriendsLanding.EnumScreens).GenericToast] = {
			screen = DependenciesModule.SocialLibraries.Components.ToastScreen,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = false
			}
		}
	}
}, { mode = RoactNavigation.StackPresentationStyle.Overlay }))