return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("EditProfileAnalyticsThrottlingThousandths", 1000)
	},
	[require(script.Parent.Enums.EventNames).EditProfileLoadingStage] = {
		description = "Edit Profile Page Opened",
		lastUpdated = { 24, 6, 10 },
		backendsList = {
			{
				type = require(script:FindFirstAncestor("EditProfile").Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end
				}
			}
		}
	}
}