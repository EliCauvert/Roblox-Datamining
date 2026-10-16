local AppChat = script:FindFirstAncestor("AppChat")

return require(AppChat.Telemetry.createReactTelemetryLayer)(require(AppChat.Parent.React).createContext(function() --[[ Line: 21 ]]
	return {}
end), {
	context = "platformChat",
	locale = "unknown",
	entryPoint = "unknown",
	userId = "unknown",
	placement = require(AppChat.Contexts.ChatPlacementContext).Enum.Unknown
})