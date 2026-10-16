game:DefineFastFlag("TextChatEnableUniverseChatTabs11", false)

return function() --[[ Line: 3 ]]
	return game:GetFastFlag("TextChatEnableUniverseChatTabs11") and game:GetEngineFeature("TextChatUniverseChatChannelAllocated")
end