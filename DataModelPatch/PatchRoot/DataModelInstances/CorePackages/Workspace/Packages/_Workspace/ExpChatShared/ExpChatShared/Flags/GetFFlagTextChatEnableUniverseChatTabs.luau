game:DefineFastFlag("TextChatEnableUniverseChatTabs11", false)

return function()
	return game:GetFastFlag("TextChatEnableUniverseChatTabs11") and game:GetEngineFeature("TextChatUniverseChatChannelAllocated")
end