local inExperienceShop = script:FindFirstAncestor("InExperienceShop")

return {
	eventName = "InExperienceShop_PrefetchOnJoin_Retried",
	description = "Counter fired each time the join-time prefetch schedules a retry after a transient fetch error under `FFlagHideShopMenuOnFailure`. One increment per scheduled retry, logged at the decision site (so users who leave during backoff still count). Ratio against `_Fired_PrimaryPath`/`_Fired_FallbackPath` approximates retries per prefetch lifecycle.",
	links = "",
	backends = {
		require(inExperienceShop.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	lastUpdated = { 2026, 5, 17 },
	throttlingPercentage = require(inExperienceShop.Flags.FIntInExperienceShopTelemetryThrottleHundredthsPercent)
}