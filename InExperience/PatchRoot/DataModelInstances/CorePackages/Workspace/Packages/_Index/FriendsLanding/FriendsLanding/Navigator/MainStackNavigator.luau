local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local _ = FriendsLanding.Parent
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local RoactNavigation = require(FriendsLanding.dependencies).RoactNavigation

return (RoactNavigation.createRobloxStackNavigator({
	{
		[require(FriendsLanding.EnumScreens).FriendsLanding] = {
			screen = require(FriendsLanding.Components.FriendsLandingScreen),
			navigationOptions = require(FriendsLanding.Components.FriendsLandingScreen.NavigationOptions)
		}
	}
}, {
	transitionConfig = function()
		-- upvalues: UserGameSettings (copy), RoactNavigation (copy)
		return if UserGameSettings.ReducedMotion then RoactNavigation.StackViewTransitionConfigs.FadeInPlace else RoactNavigation.StackViewTransitionConfigs.SlideFromRight
	end
}))