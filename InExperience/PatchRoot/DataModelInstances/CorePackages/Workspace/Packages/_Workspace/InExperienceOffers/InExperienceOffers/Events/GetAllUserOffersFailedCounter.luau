local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")

return {
	eventName = "InExperienceOffers_GetAllUserOffers_Failed",
	description = "Counter incremented once each time a `getAllUserOffers` fetch fails, on any of its tagged rejection paths (Network -- server unreachable or non-2xx; Parse -- body is not valid JSON; Schema -- parsed but missing the `offers` array). The failure's `errorKind` is attached as a payload field so failures can be filtered by type. Emitted from the fetcher's rejection sites so it captures every failure regardless of which surface's featureKeys were requested. Use to track baseline offers-fetch reliability and to alert on failure-rate regressions.",
	links = "",
	backends = {
		require(inExperienceOffers.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	lastUpdated = { 2026, 8, 24 },
	throttlingPercentage = require(inExperienceOffers.Flags.FIntInExperienceOffersTelemetryThrottleHundredthsPercent)
}