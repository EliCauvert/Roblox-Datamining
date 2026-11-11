local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("UserSearch").Parent.SocialLuaAnalytics)
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService

return SocialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = {
		EventStream = require(script.Parent.EventStreamActionList),
		Diag = require(script.Parent.DiagEventsList)
	},
	analyticsImpl = {
		EventStream = DefaultAnalyticsService.EventStream,
		Diag = DefaultAnalyticsService.Diag
	}
})