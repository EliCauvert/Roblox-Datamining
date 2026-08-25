local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local _ = friendsLanding.Parent
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local roactNavigation = require(friendsLanding.dependencies).RoactNavigation

return roactNavigation.createRobloxStackNavigator({
	{
		[require(friendsLanding.EnumScreens).FriendsLanding] = {
			screen = require(friendsLanding.Components.FriendsLandingScreen),
			navigationOptions = require(friendsLanding.Components.FriendsLandingScreen.NavigationOptions)
		}
	}
}, {
	transitionConfig = function()
		-- upvalues: userGameSettingsService (ref), roactNavigation (ref)
		return if userGameSettingsService.ReducedMotion then roactNavigation.StackViewTransitionConfigs.FadeInPlace else roactNavigation.StackViewTransitionConfigs.SlideFromRight
	end
})