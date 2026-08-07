local loggingProtocolModule = require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol)
game:DefineFastInt("AvatarChatSubsessionInputEventThrottleHundrethsPercent", 0)

return {
	eventName = "avatarChatSubsessionInput",
	description = "Report user camera/mic settings for Avatar Chat to EventIngest.",
	links = "https://roblox.atlassian.net/wiki/spaces/DA/pages/1857851197/Logging+Specs+Subsession+Analytics",
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:GetFastInt("AvatarChatSubsessionInputEventThrottleHundrethsPercent"),
	lastUpdated = { 22, 10, 17 }
}