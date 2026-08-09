local socialLuaAnalyticsModule = require(script:FindFirstAncestor("ContactsToast").Parent.SocialLuaAnalytics)
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService

return {
	EventNames = require(script.EventNames),
	Analytics = socialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			EventStream = require(script.EventStreamActionList),
			Diag = require(script.DiagActionList)
		},
		analyticsImpl = {
			EventStream = defaultAnalyticsService.EventStream,
			Diag = defaultAnalyticsService.Diag
		}
	})
}