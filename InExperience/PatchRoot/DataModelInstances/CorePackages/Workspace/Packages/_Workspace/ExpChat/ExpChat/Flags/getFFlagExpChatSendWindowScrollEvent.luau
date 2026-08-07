local getFFlagExpChatTelemetryEventTriggerModule = require(script:FindFirstAncestor("ExpChat").Flags.getFFlagExpChatTelemetryEventTrigger)
game:DefineFastFlag("ExpChatSendWindowScrollEvent", false)

return function() --[[ line: 5 ]]
	-- upvalues: getFFlagExpChatTelemetryEventTriggerModule (ref)
	return game:GetFastFlag("ExpChatSendWindowScrollEvent") and getFFlagExpChatTelemetryEventTriggerModule()
end