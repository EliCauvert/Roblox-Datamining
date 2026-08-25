local appChat = script:FindFirstAncestor("AppChat")
local conversationModule = require(appChat.Models.Conversation)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)

return function(p0)
	-- upvalues: conversationModule (ref), conversationChannelsModule (ref)
	return p0.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION and (p0.userPendingStatus == conversationChannelsModule.UserPendingStatus.Pending or p0.userPendingStatus == conversationChannelsModule.UserPendingStatus.Invalid and p0.moderationType == conversationChannelsModule.ModerationType.TrustedComms)
end