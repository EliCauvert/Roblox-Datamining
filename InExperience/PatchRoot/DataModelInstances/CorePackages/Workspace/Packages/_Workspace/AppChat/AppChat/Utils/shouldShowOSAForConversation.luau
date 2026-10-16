local ConversationModule = require(script:FindFirstAncestor("AppChat").Models.Conversation)

return function(p1): boolean --[[ Line: 4 ]]
	-- upvalues: ConversationModule (copy)
	return if p1 then p1.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION and p1.osaAcknowledgementStatus == ConversationModule.OsaAcknowledgementStatus.Unacknowledged else false
end