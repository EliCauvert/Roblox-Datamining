local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")

return {
	eventName = "GameItemDetails_RequiredField_Missing",
	description = "Counter incremented once per required field that is missing from the item's hydration data after the game item details page loads from the network. The payload carries `itemType` (the GameItemType enum name) and `field` (the client store key, or `item` when the item is not hydrated at all). Required fields are the name, the icon, and the price when the item is purchasable. Use to catch backend hydration regressions that would otherwise render a blank title, icon, or price.",
	links = "",
	backends = {
		require(ExperienceStoreServerDrivenUi.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	lastUpdated = { 2026, 11, 12 },
	throttlingPercentage = require(ExperienceStoreServerDrivenUi.Flags.FIntGameItemDetailsTelemetryThrottleHundredthsPercent)
}