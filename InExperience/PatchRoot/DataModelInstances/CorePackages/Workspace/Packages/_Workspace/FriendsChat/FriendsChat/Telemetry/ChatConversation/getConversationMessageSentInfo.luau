local sendMessageErrorModule = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.SendMessageError)

return function(p1, p2)
	-- upvalues: sendMessageErrorModule (ref)
	local t = {
		messageSentResult = sendMessageErrorModule.OtherFailure,
		recipientIds = p2
	}
	
	if p1 == nil then
		t.messageSentResult = sendMessageErrorModule.NoResponse
		
		return t
	elseif (p1.StatusCode or p1.responseCode) == 409 then
		t.messageSentResult = sendMessageErrorModule.Conflict
		
		return t
	elseif p1.responseBody == nil then
		t.messageSentResult = sendMessageErrorModule.NoResponseBody
		
		return t
	end
	local messages = p1.responseBody.messages
	
	if messages == nil or #messages == 0 then
		t.messageSentResult = sendMessageErrorModule.NoMessages
		
		return t
	end
	local var1 = messages[1]
	
	if var1.status == nil then
		t.messageSentResult = sendMessageErrorModule.NoMessageStatus
		
		return t
	end
	t.messageSentResult = var1.status
	t.messageId = var1.id
	
	return t
end