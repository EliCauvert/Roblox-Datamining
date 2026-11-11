local EditProfileAnalyticsContextModule = require(script.EditProfileAnalyticsContext)

return {
	AnalyticsService = require(script.AnalyticsService),
	Context = EditProfileAnalyticsContextModule,
	connect = require(script:FindFirstAncestor("EditProfile").Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Context.getConnect(EditProfileAnalyticsContextModule),
	EventNames = require(script.Enums.EventNames),
	setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents),
	useAnalytics = require(script.useAnalytics),
	AnalyticsServiceV2 = require(script.AnalyticsServiceV2)
}