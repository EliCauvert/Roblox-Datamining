local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")

return {
	eventName = "GameItemDetails_LegacySubscription_CreatorMissing",
	description = "Counter incremented when the game item details experiment's control group opens SubscriptionPurchase for a subscription whose creator isn't hydrated on the entry surface, so the page shows a blank provider name. The creator comes from the universe's creatorType and creatorId plus the creator store. A rise means the entry surface stopped hydrating the universe or its creator.",
	links = "",
	backends = {
		require(ExperienceStoreServerDrivenUi.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	lastUpdated = { 2026, 11, 18 },
	throttlingPercentage = require(ExperienceStoreServerDrivenUi.Flags.FIntGameItemDetailsTelemetryThrottleHundredthsPercent)
}