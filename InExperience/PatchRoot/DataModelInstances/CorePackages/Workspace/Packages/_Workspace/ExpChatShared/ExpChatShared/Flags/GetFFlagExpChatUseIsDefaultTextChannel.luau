game:DefineFastFlag("ExpChatUseIsDefaultTextChannel", false)

return function()
	return game:GetFastFlag("ExpChatUseIsDefaultTextChannel") and game:GetEngineFeature("EnableTextChannelDisplayMode")
end