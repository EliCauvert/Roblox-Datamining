local inExperienceShop = script:FindFirstAncestor("InExperienceShop")

return {
	eventName = "InExperienceShop_FirstOpen",
	description = "Counter fired the first time the in-experience shop window mounts within a session, gated by `FFlagEnableShopPrefetch`. Acts as the denominator for the prefetch-hit-rate metric (`_FirstOpen_PrefetchHit / _FirstOpen`).",
	links = "",
	backends = {
		require(inExperienceShop.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	lastUpdated = { 2026, 5, 17 },
	throttlingPercentage = require(inExperienceShop.Flags.FIntInExperienceShopTelemetryThrottleHundredthsPercent)
}