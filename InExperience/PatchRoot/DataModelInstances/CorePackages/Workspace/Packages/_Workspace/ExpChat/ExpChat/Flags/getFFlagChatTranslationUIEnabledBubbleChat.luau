local TextChatService = game:GetService("TextChatService")

return function(): boolean --[[ Line: 3 ]]
	-- upvalues: TextChatService (copy)
	return TextChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService
end