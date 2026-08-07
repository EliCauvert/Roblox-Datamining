local textChatService = game:GetService("TextChatService")

return function() --[[ line: 3 ]]
	-- upvalues: textChatService (ref)
	return textChatService.ChatVersion ~= Enum.ChatVersion.LegacyChatService
end