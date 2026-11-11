local DiscoverabilityModalAnalyticsContextModule = require(script.DiscoverabilityModalAnalyticsContext)

return {
	setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents),
	Context = DiscoverabilityModalAnalyticsContextModule,
	connect = require(script.Parent.dependencies).SocialLibraries.Context.getConnect(DiscoverabilityModalAnalyticsContextModule),
	EventNames = require(script.Enums.EventNames),
	useAnalytics = require(script.useAnalytics),
	EntryPoints = require(script.Enums.EntryPoints),
	AnalyticsService = require(script.AnalyticsService)
}