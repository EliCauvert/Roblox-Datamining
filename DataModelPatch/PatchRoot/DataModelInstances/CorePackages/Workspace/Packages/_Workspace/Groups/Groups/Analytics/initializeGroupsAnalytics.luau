local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("Groups").Parent.SocialLuaAnalytics)

return SocialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = {
		EventStream = require(script.Parent.EventStreamActionList)
	},
	analyticsImpl = {
		EventStream = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.EventStream
	}
})