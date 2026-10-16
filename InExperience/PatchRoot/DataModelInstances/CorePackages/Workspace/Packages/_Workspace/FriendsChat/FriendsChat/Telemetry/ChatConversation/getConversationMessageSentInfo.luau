local SendMessageErrorModule = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.SendMessageError)

return function(p1, RecipientIds) --[[ Line: 27 | Named "getConversationMessageSentInfo" ]]
	-- upvalues: SendMessageErrorModule (copy)
	local config = {
		messageSentResult = SendMessageErrorModule.OtherFailure,
		recipientIds = RecipientIds
	}
	
	if p1 == nil then
		config.messageSentResult = SendMessageErrorModule.NoResponse
		
		return config
	elseif (p1.StatusCode or p1.responseCode) == 409 then
		config.messageSentResult = SendMessageErrorModule.Conflict
		
		return config
	elseif p1.responseBody == nil then
		config.messageSentResult = SendMessageErrorModule.NoResponseBody
		
		return config
	else
		local Messages = p1.responseBody.messages
		
		if Messages == nil or #Messages == 0 then
			config.messageSentResult = SendMessageErrorModule.NoMessages
			
			return config
		end
		local Message = Messages[1]
		
		if Message.status == nil then
			config.messageSentResult = SendMessageErrorModule.NoMessageStatus
			
			return config
		else
			config.messageSentResult = Message.status
			config.messageId = Message.id
			
			return config
		end
	end
end