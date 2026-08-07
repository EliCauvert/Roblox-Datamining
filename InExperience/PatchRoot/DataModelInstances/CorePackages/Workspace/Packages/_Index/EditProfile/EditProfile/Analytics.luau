local editProfileAnalyticsContextModule = require(script.EditProfileAnalyticsContext)

return {
	AnalyticsService = require(script.AnalyticsService),
	Context = editProfileAnalyticsContextModule,
	connect = require(script:FindFirstAncestor("EditProfile").Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Context.getConnect(editProfileAnalyticsContextModule),
	EventNames = require(script.Enums.EventNames),
	setupFireAnalyticsEvents = require(script.setupFireAnalyticsEvents),
	useAnalytics = require(script.useAnalytics),
	AnalyticsServiceV2 = require(script.AnalyticsServiceV2)
}