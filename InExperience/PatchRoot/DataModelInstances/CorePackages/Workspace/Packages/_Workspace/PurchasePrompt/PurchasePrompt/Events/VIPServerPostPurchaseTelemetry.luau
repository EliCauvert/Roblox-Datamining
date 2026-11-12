local LoggingProtocolModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.LoggingProtocol)
local VIPServerPostPurchaseTelemetryThrottleHundredthsPercent = game:DefineFastInt("VIPServerPostPurchaseTelemetryThrottleHundredthsPercent", 10000)

return {
	PrivateServerConfigEvent = {
		eventName = "privateServerConfig",
		description = "Impressions and clicks on the in-experience private server setup and join screens.",
		backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
		lastUpdated = { 2026, 11, 6 },
		throttlingPercentage = VIPServerPostPurchaseTelemetryThrottleHundredthsPercent
	},
	VIPServerTeleportFailedCounter = {
		eventName = "VIPServerPostPurchaseTeleportFailedCounter",
		description = "Counter fired when teleporting the buyer into their new private server fails.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 11, 6 },
		throttlingPercentage = VIPServerPostPurchaseTelemetryThrottleHundredthsPercent
	}
}