return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("SetAliasAnalyticsThrottlingThousandths", 1000)
	},
	[require(script.Parent.Enums.EventNames).CustomizeNameLoadingStage] = {
		description = "Set Alias View Opened",
		lastUpdated = { 24, 6, 10 },
		backendsList = {
			{
				type = require(script:FindFirstAncestor("SetAlias").Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = {
					status = function(p0)
						return p0
					end
				}
			}
		}
	}
}