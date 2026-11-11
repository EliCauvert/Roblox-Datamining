local SetAliasAnalyticsContextModule = require(script.SetAliasAnalyticsContext)

return {
	AnalyticsService = require(script.AnalyticsService),
	Context = SetAliasAnalyticsContextModule,
	connect = require(script.Parent.dependencies).SocialLibraries.Context.getConnect(SetAliasAnalyticsContextModule),
	EventNames = require(script.Enums.EventNames),
	EntryPoints = require(script.Enums.EntryPoints),
	setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents),
	useAnalytics = require(script.useAnalytics)
}