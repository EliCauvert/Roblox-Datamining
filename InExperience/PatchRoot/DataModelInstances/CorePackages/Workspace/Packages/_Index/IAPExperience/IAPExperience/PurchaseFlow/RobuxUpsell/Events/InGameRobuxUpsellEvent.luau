local loggingProtocolModule = require(script:FindFirstAncestor("IAPExperience").Parent.LoggingProtocol)
game:DefineFastInt("InGameRobuxUpsellEventThrottleHundredthsPercent", 0)

return {
	eventName = "InGameRobuxUpsellEvent",
	description = "Data points on all InGameRobuxUpsell events.",
	links = "https://roblox.atlassian.net/wiki/spaces/PAY/pages/1823605171/Robux+Upsell+InGame",
	backends = {
		loggingProtocolModule.TelemetryBackends.Points,
		loggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:GetFastInt("InGameRobuxUpsellEventThrottleHundredthsPercent"),
	lastUpdated = { 2024, 8, 22 }
}