local appChat = script:FindFirstAncestor("AppChat")

return require(appChat.Telemetry.createReactTelemetryLayer)(require(appChat.Parent.React).createContext(function()
	return {}
end), {
	context = "platformChat",
	locale = "unknown",
	entryPoint = "unknown",
	userId = "unknown",
	placement = require(appChat.Contexts.ChatPlacementContext).Enum.Unknown
})