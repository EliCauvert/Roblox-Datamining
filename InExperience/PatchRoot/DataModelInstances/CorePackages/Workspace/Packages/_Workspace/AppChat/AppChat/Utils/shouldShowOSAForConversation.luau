local conversationModule = require(script:FindFirstAncestor("AppChat").Models.Conversation)

return function(p1)
	-- upvalues: conversationModule (ref)
	return if p1 then p1.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION and p1.osaAcknowledgementStatus == conversationModule.OsaAcknowledgementStatus.Unacknowledged else false
end