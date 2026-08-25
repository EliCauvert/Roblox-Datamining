local sendMessageErrorModule = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.SendMessageError)

return function(p0, p1)
	-- upvalues: sendMessageErrorModule (ref)
	local t = {
		messageSentResult = sendMessageErrorModule.OtherFailure,
		recipientIds = p1
	}
	
	if p0 == nil then
		t.messageSentResult = sendMessageErrorModule.NoResponse
		
		return t
	elseif (p0.StatusCode or p0.responseCode) == 409 then
		t.messageSentResult = sendMessageErrorModule.Conflict
		
		return t
	elseif p0.responseBody == nil then
		t.messageSentResult = sendMessageErrorModule.NoResponseBody
		
		return t
	end
	local messages = p0.responseBody.messages
	
	if messages == nil or #messages == 0 then
		t.messageSentResult = sendMessageErrorModule.NoMessages
		
		return t
	end
	local var2 = messages[1]
	
	if var2.status == nil then
		t.messageSentResult = sendMessageErrorModule.NoMessageStatus
		
		return t
	end
	t.messageSentResult = var2.status
	t.messageId = var2.id
	
	return t
end