local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local roactNavigationModule = require(parent.RoactNavigation)
local routesModule = require(moments.Navigation.Routes)
local var3 = if require(parent.SharedFlags).FFlagMomentsWatchSessionalization then routesModule.MomentsFeed else routesModule.TrendingScreen

return roactNavigationModule.createRobloxSwitchNavigator({
	{
		[var3] = { screen = require(moments.Components.TrendingScreen) }
	}
}, {
	keepVisitedScreensMounted = true,
	initialRouteName = var3,
	backBehavior = roactNavigationModule.BackBehavior.History
})