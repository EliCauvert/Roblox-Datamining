local ContactImporterAnalyticsContextModule = require(script.ContactImporterAnalyticsContext)

return {
	setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents),
	Context = ContactImporterAnalyticsContextModule,
	connect = require(script:FindFirstAncestor("ContactImporter").dependencies).SocialLibraries.Context.getConnect(ContactImporterAnalyticsContextModule),
	useAnalytics = require(script.useAnalytics),
	EventNames = require(script.Enums.EventNames),
	EntryPoints = require(script.Enums.ContactImporterEntryPoints),
	FieldNames = require(script.FieldNames),
	AnalyticsService = require(script.AnalyticsService)
}