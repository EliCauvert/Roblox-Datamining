local context = require(script:FindFirstAncestor("FriendsLanding").dependencies).SocialLibraries.Context
local analyticsContextModule = require(script.AnalyticsContext)

return {
	Class = require(script.FriendsLandingAnalytics),
	Context = analyticsContextModule,
	connect = context.getConnect(analyticsContextModule),
	with = context.getWith(analyticsContextModule),
	ButtonClickEvents = require(script.ButtonClickEvents),
	AddFriendsPageLoadAnalytics = require(script.AddFriendsPageLoadAnalytics),
	ImpressionEvents = require(script.ImpressionEvents)
}