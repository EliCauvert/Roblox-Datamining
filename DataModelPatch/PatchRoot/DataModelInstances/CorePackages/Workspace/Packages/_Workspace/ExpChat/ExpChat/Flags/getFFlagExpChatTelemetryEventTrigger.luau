game:DefineFastFlag("ExpChatTelemetryEventTrigger3", false)

return function()
	return game:GetFastFlag("ExpChatTelemetryEventTrigger3") and game:GetEngineFeature("ExpChatTelemetryEventTrigger")
end