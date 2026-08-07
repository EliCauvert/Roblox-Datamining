local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")

return {
	eventName = "BulkPurchaseMissingPurchaseOptionsCounter",
	description = "Counter fired when bulk purchase server response contains at least one item missing purchaseOptions while FFlagBulkPurchaseUsesPurchaseOptionDiscount is on.",
	links = "",
	backends = {
		require(avatarExperienceAnalytics.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	lastUpdated = { 2026, 5, 7 },
	throttlingPercentage = require(avatarExperienceAnalytics.Flags.FIntBulkPurchaseMissingPurchaseOptionsCounterThrottleHundredthsPercent)()
}