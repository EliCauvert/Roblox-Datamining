local conversationModule = require(script:FindFirstAncestor("AppChat").Models.Conversation)

return function(p0)
	-- upvalues: conversationModule (ref)
	return if p0 then p0.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION and p0.osaAcknowledgementStatus == conversationModule.OsaAcknowledgementStatus.Unacknowledged else false
end