local socialLuaAnalyticsModule = require(game:GetService("CorePackages").Workspace.Packages.SocialLuaAnalytics)

return {
	Analytics = socialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			Diag = nil,
			EventStream = require(script.EventStreamActionList)
		},
		analyticsImpl = {
			Diag = nil,
			EventStream = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.EventStream
		}
	}),
	useAnalytics = require(script.useAnalytics)
}