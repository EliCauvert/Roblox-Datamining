local appChat = script:FindFirstAncestor("AppChat")
local conversationModule = require(appChat.Models.Conversation)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)

return function(p1)
	-- upvalues: conversationModule (ref), conversationChannelsModule (ref)
	return p1.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION and (p1.userPendingStatus == conversationChannelsModule.UserPendingStatus.Pending or p1.userPendingStatus == conversationChannelsModule.UserPendingStatus.Invalid and p1.moderationType == conversationChannelsModule.ModerationType.TrustedComms)
end