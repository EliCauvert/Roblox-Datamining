local AppChat = script:FindFirstAncestor("AppChat")
local ConversationModule = require(AppChat.Models.Conversation)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)

return function(p1): boolean
	-- upvalues: ConversationModule (copy), ConversationChannelsModule (copy)
	return p1.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION and (p1.userPendingStatus == ConversationChannelsModule.UserPendingStatus.Pending or p1.userPendingStatus == ConversationChannelsModule.UserPendingStatus.Invalid and p1.moderationType == ConversationChannelsModule.ModerationType.TrustedComms)
end