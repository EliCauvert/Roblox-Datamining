local socialLuaAnalyticsModule = require(script:FindFirstAncestor("UserSearch").Parent.SocialLuaAnalytics)
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService

return socialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = {
		EventStream = require(script.Parent.EventStreamActionList),
		Diag = require(script.Parent.DiagEventsList)
	},
	analyticsImpl = {
		EventStream = defaultAnalyticsService.EventStream,
		Diag = defaultAnalyticsService.Diag
	}
})