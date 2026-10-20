game:DefineFastFlag("ExpChatTriggerWindowStatusEvent", false)

return function()
	return game:GetFastFlag("ExpChatTriggerWindowStatusEvent") and game:GetEngineFeature("ExpChatWindowStateEventUpdate")
end