game:DefineFastFlag("ExpChatTriggerWindowStatusEvent", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("ExpChatTriggerWindowStatusEvent") and game:GetEngineFeature("ExpChatWindowStateEventUpdate")
end