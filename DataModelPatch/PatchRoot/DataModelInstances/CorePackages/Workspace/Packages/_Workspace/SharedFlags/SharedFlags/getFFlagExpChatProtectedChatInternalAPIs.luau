local TextChatService = game:GetService("TextChatService")
local IsProtectedChatEnabled = game:DefineFastFlag("ExpChatUseInternalTextChatAPIs", false) and (game:GetEngineFeature("TextChatServiceInternalAPIs2") and (game:GetEngineFeature("TextChatServiceProtectedChatEnabled") and TextChatService:IsProtectedChatEnabled()))

return function()
	-- upvalues: IsProtectedChatEnabled (copy)
	return IsProtectedChatEnabled
end