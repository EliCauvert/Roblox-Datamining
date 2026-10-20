local SocialLuaAnalyticsModule = require(game:GetService("CorePackages").Workspace.Packages.SocialLuaAnalytics)

return {
	Analytics = SocialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			Diag = nil,
			EventStream = require(script.EventStreamActionList)
		},
		analyticsImpl = {
			Diag = nil,
			EventStream = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.EventStream
		}
	}),
	useAnalytics = require(script.useAnalytics)
}