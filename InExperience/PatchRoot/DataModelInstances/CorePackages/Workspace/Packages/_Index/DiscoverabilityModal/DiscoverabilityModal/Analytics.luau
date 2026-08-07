local discoverabilityModalAnalyticsContextModule = require(script.DiscoverabilityModalAnalyticsContext)

return {
	setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents),
	Context = discoverabilityModalAnalyticsContextModule,
	connect = require(script.Parent.dependencies).SocialLibraries.Context.getConnect(discoverabilityModalAnalyticsContextModule),
	EventNames = require(script.Enums.EventNames),
	useAnalytics = require(script.useAnalytics),
	EntryPoints = require(script.Enums.EntryPoints),
	AnalyticsService = require(script.AnalyticsService)
}