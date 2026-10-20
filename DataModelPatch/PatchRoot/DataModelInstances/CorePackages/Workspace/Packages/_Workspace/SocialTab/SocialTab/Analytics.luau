local AnalyticsContextModule = require(script.AnalyticsContext)
local Context = require(script:FindFirstAncestor("SocialTab").dependencies).SocialLibraries.Context

return {
	Class = require(script.SocialTabAnalytics),
	Context = AnalyticsContextModule,
	connect = Context.getConnect(AnalyticsContextModule),
	with = Context.getWith(AnalyticsContextModule)
}