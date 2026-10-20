local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("ContactsToast").Parent.SocialLuaAnalytics)
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService

return {
	EventNames = require(script.EventNames),
	Analytics = SocialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			EventStream = require(script.EventStreamActionList),
			Diag = require(script.DiagActionList)
		},
		analyticsImpl = {
			EventStream = DefaultAnalyticsService.EventStream,
			Diag = DefaultAnalyticsService.Diag
		}
	})
}