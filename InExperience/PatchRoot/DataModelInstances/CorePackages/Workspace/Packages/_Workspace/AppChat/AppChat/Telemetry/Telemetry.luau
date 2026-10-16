local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("AppChat").Parent.SocialLuaAnalytics)

return {
	new = SocialLuaAnalyticsModule.Telemetry.new,
	contexts = SocialLuaAnalyticsModule.Analytics.Enums.Contexts
}