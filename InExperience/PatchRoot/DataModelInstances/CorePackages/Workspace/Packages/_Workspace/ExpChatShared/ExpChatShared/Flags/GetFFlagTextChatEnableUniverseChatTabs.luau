game:DefineFastFlag("TextChatEnableUniverseChatTabs11", false)

return function() --[[ line: 3 ]]
	return game:GetFastFlag("TextChatEnableUniverseChatTabs11") and game:GetEngineFeature("TextChatUniverseChatChannelAllocated")
end