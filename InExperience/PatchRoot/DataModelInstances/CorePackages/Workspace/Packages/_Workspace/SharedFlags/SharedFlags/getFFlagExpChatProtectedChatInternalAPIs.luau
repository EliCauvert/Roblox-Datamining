game:DefineFastFlag("ExpChatUseInternalTextChatAPIs2", false)

return function() --[[ line: 12 ]]
	return game:GetFastFlag("ExpChatUseInternalTextChatAPIs2") and (game:GetEngineFeature("TextChatServiceInternalAPIs2") and (game:GetEngineFeature("TextChatServiceProtectedChatEnabled") and game:GetService("TextChatService"):IsProtectedChatEnabled()))
end