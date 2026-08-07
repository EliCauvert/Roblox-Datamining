local socialLuaAnalyticsModule = require(script:FindFirstAncestor("Groups").Parent.SocialLuaAnalytics)

return socialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = {
		EventStream = require(script.Parent.EventStreamActionList)
	},
	analyticsImpl = {
		EventStream = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.EventStream
	}
})