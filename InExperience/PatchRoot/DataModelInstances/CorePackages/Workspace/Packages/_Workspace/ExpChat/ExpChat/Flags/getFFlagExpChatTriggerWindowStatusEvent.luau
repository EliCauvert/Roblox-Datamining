game:DefineFastFlag("ExpChatTriggerWindowStatusEvent", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("ExpChatTriggerWindowStatusEvent") and game:GetEngineFeature("ExpChatWindowStateEventUpdate")
end