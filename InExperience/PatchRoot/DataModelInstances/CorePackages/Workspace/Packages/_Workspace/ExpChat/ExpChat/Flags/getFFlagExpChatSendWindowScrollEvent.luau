local GetFFlagExpChatTelemetryEventTriggerModule = require(script:FindFirstAncestor("ExpChat").Flags.getFFlagExpChatTelemetryEventTrigger)
game:DefineFastFlag("ExpChatSendWindowScrollEvent", false)

return function()
	-- upvalues: GetFFlagExpChatTelemetryEventTriggerModule (copy)
	return game:GetFastFlag("ExpChatSendWindowScrollEvent") and GetFFlagExpChatTelemetryEventTriggerModule()
end