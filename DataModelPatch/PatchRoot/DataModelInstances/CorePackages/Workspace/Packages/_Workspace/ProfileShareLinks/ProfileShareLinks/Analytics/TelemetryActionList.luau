local Parent = script:FindFirstAncestor("ProfileShareLinks").Parent
local Identity = require(Parent.Dash).identity

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
				type = require(Parent.SocialLuaAnalytics).Analytics.Enums.SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = { context = Identity, shareType = Identity }
			}
		}
	}
}