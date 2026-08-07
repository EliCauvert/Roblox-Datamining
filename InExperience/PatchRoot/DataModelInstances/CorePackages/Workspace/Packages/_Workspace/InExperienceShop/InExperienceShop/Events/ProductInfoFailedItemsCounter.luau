local inExperienceShop = script:FindFirstAncestor("InExperienceShop")

return {
	eventName = "InExperienceShop_ProductInfo_FailedItems",
	description = "Counter incremented by the number of items whose `GetProductInfoAsync` lookup failed (or was missing) during a single `buildShopDataFromWidgets` call -- i.e. items that the user would have seen as missing tiles before the on-reopen recovery path retries them. Emitted once per fetch, only when at least one item failed, with the failure count as the increment value. Use to track baseline `GetProductInfo` reliability and to size the population the refresh-recovery path (under `FFlagEnableShopProductInfoRefresh`) is recovering for.",
	links = "",
	backends = {
		require(inExperienceShop.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	lastUpdated = { 2026, 5, 20 },
	throttlingPercentage = require(inExperienceShop.Flags.FIntInExperienceShopTelemetryThrottleHundredthsPercent)
}