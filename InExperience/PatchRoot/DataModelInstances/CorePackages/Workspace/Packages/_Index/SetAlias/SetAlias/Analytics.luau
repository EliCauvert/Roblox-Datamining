local setAliasAnalyticsContextModule = require(script.SetAliasAnalyticsContext)

return {
	AnalyticsService = require(script.AnalyticsService),
	Context = setAliasAnalyticsContextModule,
	connect = require(script.Parent.dependencies).SocialLibraries.Context.getConnect(setAliasAnalyticsContextModule),
	EventNames = require(script.Enums.EventNames),
	EntryPoints = require(script.Enums.EntryPoints),
	setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents),
	useAnalytics = require(script.useAnalytics)
}