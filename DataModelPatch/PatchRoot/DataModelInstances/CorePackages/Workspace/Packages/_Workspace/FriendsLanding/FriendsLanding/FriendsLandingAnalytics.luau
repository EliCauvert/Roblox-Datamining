local Context = require(script:FindFirstAncestor("FriendsLanding").dependencies).SocialLibraries.Context
local AnalyticsContextModule = require(script.AnalyticsContext)

return {
	Class = require(script.FriendsLandingAnalytics),
	Context = AnalyticsContextModule,
	connect = Context.getConnect(AnalyticsContextModule),
	with = Context.getWith(AnalyticsContextModule),
	ButtonClickEvents = require(script.ButtonClickEvents),
	AddFriendsPageLoadAnalytics = require(script.AddFriendsPageLoadAnalytics),
	ImpressionEvents = require(script.ImpressionEvents)
}