local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoutesModule = require(Moments.Navigation.Routes)
local MomentsFeed = if require(Parent.SharedFlags).FFlagMomentsWatchSessionalization then RoutesModule.MomentsFeed else RoutesModule.TrendingScreen

return (RoactNavigationModule.createRobloxSwitchNavigator({
	{
		[MomentsFeed] = { screen = require(Moments.Components.TrendingScreen) }
	}
}, {
	keepVisitedScreensMounted = true,
	initialRouteName = MomentsFeed,
	backBehavior = RoactNavigationModule.BackBehavior.History
}))