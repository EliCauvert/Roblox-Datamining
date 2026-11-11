local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("FriendsCarousel").Parent.SocialLuaAnalytics)
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService

return SocialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = {
		EventStream = require(script.Parent.EventStreamActionList),
		Diag = require(script.Parent.DiagActionList)
	},
	analyticsImpl = {
		EventStream = DefaultAnalyticsService.EventStream,
		Diag = DefaultAnalyticsService.Diag
	}
})