local inExperienceShop = script:FindFirstAncestor("InExperienceShop")

return {
	eventName = "InExperienceShop_Open",
	description = "Counter fired every time the in-experience shop window mounts. Intentionally not flag-gated and not latched -- closing-and-reopening within a session counts each time -- so it can serve as a session-independent denominator for engagement metrics that span the prefetch-on-join experiment.",
	links = "",
	backends = {
		require(inExperienceShop.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	lastUpdated = { 2026, 5, 17 },
	throttlingPercentage = require(inExperienceShop.Flags.FIntInExperienceShopTelemetryThrottleHundredthsPercent)
}