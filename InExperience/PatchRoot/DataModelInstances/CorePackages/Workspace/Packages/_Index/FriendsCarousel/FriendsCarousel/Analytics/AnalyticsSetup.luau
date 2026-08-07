local socialLuaAnalyticsModule = require(script:FindFirstAncestor("FriendsCarousel").Parent.SocialLuaAnalytics)
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService

return socialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = {
		EventStream = require(script.Parent.EventStreamActionList),
		Diag = require(script.Parent.DiagActionList)
	},
	analyticsImpl = {
		EventStream = defaultAnalyticsService.EventStream,
		Diag = defaultAnalyticsService.Diag
	}
})