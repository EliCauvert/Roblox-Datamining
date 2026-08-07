local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local roactNavigation = dependenciesModule.RoactNavigation

return roactNavigation.createRobloxStackNavigator({
	{
		ModalStackNavigator = {
			screen = require(friendsLanding.Navigator.ModalStackNavigator),
			navigationOptions = { transparent = true, absorbInputSelectable = false }
		}
	},
	{
		[require(friendsLanding.EnumScreens).GenericToast] = {
			screen = dependenciesModule.SocialLibraries.Components.ToastScreen,
			navigationOptions = {
				overlayEnabled = true,
				overlayTransparency = 1,
				absorbInput = false
			}
		}
	}
}, { mode = roactNavigation.StackPresentationStyle.Overlay })