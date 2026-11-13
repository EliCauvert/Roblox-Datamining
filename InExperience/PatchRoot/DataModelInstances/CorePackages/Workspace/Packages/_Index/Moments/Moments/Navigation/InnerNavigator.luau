local Moments = script:FindFirstAncestor("Moments")
local RoactNavigationModule = require(Moments.Parent.RoactNavigation)
local TrendingScreenModule = require(Moments.Components.TrendingScreen)
local MomentsFeed = require(Moments.Navigation.Routes).MomentsFeed

return (RoactNavigationModule.createRobloxSwitchNavigator({ { [MomentsFeed] = { screen = TrendingScreenModule } } }, {
	keepVisitedScreensMounted = true,
	initialRouteName = MomentsFeed,
	backBehavior = RoactNavigationModule.BackBehavior.History
}))