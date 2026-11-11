local _ = require(script:FindFirstAncestor("PurchasePrompt").Parent.LoggingProtocol)

return {
	RerenderTimingStat = {
		eventName = "PurchasePromptAppRerenderTiming",
		throttlingPercentage = 1000,
		description = "Stat for tracking re-render timing in PurchasePromptApp to detect performance issues",
		links = "https://roblox.atlassian.net/browse/APPEXP-2951",
		backends = { "RobloxTelemetryStat" },
		lastUpdated = { 2025, 8, 4 }
	}
}