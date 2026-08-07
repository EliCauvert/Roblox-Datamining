local loggingProtocolModule = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol)
game:DefineFastInt("AvatarChatSubsessionStatsEventThrottleHundrethsPercent", 0)

return {
	eventName = "avatarChatSubsessionStats",
	description = "Report FACS sending/receiving time per Avatar Chat session to EventIngest.",
	links = "https://roblox.atlassian.net/wiki/spaces/DA/pages/1857851197/Logging+Specs+Subsession+Analytics",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:GetFastInt("AvatarChatSubsessionStatsEventThrottleHundrethsPercent"),
	lastUpdated = { 22, 10, 17 }
}