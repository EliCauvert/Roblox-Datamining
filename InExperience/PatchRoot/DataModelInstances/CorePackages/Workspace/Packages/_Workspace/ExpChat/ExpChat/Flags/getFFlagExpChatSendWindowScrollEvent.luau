local GetFFlagExpChatTelemetryEventTriggerModule = require(script:FindFirstAncestor("ExpChat").Flags.getFFlagExpChatTelemetryEventTrigger)
game:DefineFastFlag("ExpChatSendWindowScrollEvent", false)

return function() --[[ Line: 5 ]]
	-- upvalues: GetFFlagExpChatTelemetryEventTriggerModule (copy)
	return game:GetFastFlag("ExpChatSendWindowScrollEvent") and GetFFlagExpChatTelemetryEventTriggerModule()
end