local socialLuaAnalyticsModule = require(script:FindFirstAncestor("AppChat").Parent.SocialLuaAnalytics)

return {
	new = socialLuaAnalyticsModule.Telemetry.new,
	contexts = socialLuaAnalyticsModule.Analytics.Enums.Contexts
}