local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")

return {
	eventName = "GameItemDetails_StoreRefresh_Skipped",
	description = "Counter incremented when leaving a developer product's page (the native game item details page, or the web page the experiment's control group opens) can't refresh the store because the universe is hydrated without a root place. Leaving before the universe is hydrated at all (the page never loaded) is not counted. The store cell stays stale until the next fetch, so a rise means the universe hydration on the entry surface lost root_place_id.",
	links = "",
	backends = {
		require(ExperienceStoreServerDrivenUi.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	lastUpdated = { 2026, 11, 13 },
	throttlingPercentage = require(ExperienceStoreServerDrivenUi.Flags.FIntGameItemDetailsTelemetryThrottleHundredthsPercent)
}