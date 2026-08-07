game:DefineFastFlag("ExpChatTelemetryEventTrigger3", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("ExpChatTelemetryEventTrigger3") and game:GetEngineFeature("ExpChatTelemetryEventTrigger")
end