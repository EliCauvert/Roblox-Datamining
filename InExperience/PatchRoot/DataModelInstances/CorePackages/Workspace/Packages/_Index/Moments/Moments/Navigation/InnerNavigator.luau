local Moments = script:FindFirstAncestor("Moments")
local RoactNavigationModule = require(Moments.Parent.RoactNavigation)
local MomentsFeed = require(Moments.Navigation.Routes).MomentsFeed

return (RoactNavigationModule.createRobloxSwitchNavigator({
	{
		[MomentsFeed] = { screen = require(Moments.Components.TrendingScreen) }
	}
}, {
	keepVisitedScreensMounted = true,
	initialRouteName = MomentsFeed,
	backBehavior = RoactNavigationModule.BackBehavior.History
}))