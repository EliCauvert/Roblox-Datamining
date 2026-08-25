local textChatService = game:GetService("TextChatService")

return function()
	-- upvalues: textChatService (ref)
	return textChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService
end