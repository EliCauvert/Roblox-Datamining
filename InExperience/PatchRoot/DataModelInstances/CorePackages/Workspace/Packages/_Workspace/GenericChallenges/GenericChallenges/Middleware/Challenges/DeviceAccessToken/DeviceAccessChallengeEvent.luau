local loggingProtocolModule = require(script:FindFirstAncestor("GenericChallenges").Parent.LoggingProtocol)
game:DefineFastInt("LuaAppChallengeDeviceAccessEventThrottlingPercent", 10000)

return {
	eventName = "accountSecurityChallengeDeviceAccessTokenEvent",
	description = "Tracks lifecycle events for the Device Access GCS challenge",
	links = "https://roblox.atlassian.net/wiki/spaces/BaS/pages/2184872709/Bypassing+Challenges+for+Xbox+PS+Quest+etc+Requests#Event-Tracking",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:GetFastInt("LuaAppChallengeDeviceAccessEventThrottlingPercent"),
	lastUpdated = { 24, 1, 22 }
}