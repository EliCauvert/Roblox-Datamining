local moments = script:FindFirstAncestor("Moments")
local roactNavigationModule = require(moments.Parent.RoactNavigation)
local momentsFeed = require(moments.Navigation.Routes).MomentsFeed

return roactNavigationModule.createRobloxSwitchNavigator({
	{
		[momentsFeed] = { screen = require(moments.Components.TrendingScreen) }
	}
}, {
	keepVisitedScreensMounted = true,
	initialRouteName = momentsFeed,
	backBehavior = roactNavigationModule.BackBehavior.History
})