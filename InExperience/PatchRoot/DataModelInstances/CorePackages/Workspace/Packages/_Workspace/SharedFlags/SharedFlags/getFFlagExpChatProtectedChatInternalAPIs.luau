local var0 = game:DefineFastFlag("ExpChatUseInternalTextChatAPIs", false) and (game:GetEngineFeature("TextChatServiceInternalAPIs2") and game:GetService("TextChatService").EnableProtectedChat == Enum.RolloutState.Enabled)

return function() --[[ line: 15 ]]
	-- upvalues: var0 (ref)
	return var0
end