game:DefineFastFlag("ExpChatUseIsDefaultTextChannel", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("ExpChatUseIsDefaultTextChannel") and game:GetEngineFeature("EnableTextChannelDisplayMode")
end