local parent = script:FindFirstAncestor("ProfileShareLinks").Parent
local identity = require(parent.Dash).identity

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("ProfileShareLinksAnalyticsThrottlingThousandths", 1000)
	},
	[require(script.Parent.EventNames).ProfileShareLinkActivated] = {
		description = "Profile share link button activated",
		lastUpdated = { 24, 6, 11 },
		backendsList = {
			{
				type = require(parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = { context = identity, shareType = identity }
			}
		}
	}
}