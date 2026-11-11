local TextChatService = game:GetService("TextChatService")

return function(): boolean
	-- upvalues: TextChatService (copy)
	return TextChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService
end