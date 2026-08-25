local appChat = script:FindFirstAncestor("AppChat")
local conversationModule = require(appChat.Models.Conversation)
local fFlagAppChatEnableU13ChatOptIn = require(appChat.Parent.SharedFlags).FFlagAppChatEnableU13ChatOptIn

return function(p0)
	-- upvalues: fFlagAppChatEnableU13ChatOptIn (ref), conversationModule (ref)
	return if fFlagAppChatEnableU13ChatOptIn then if p0 then p0.userOptedIntoChatMessages == conversationModule.UserOptedIntoChatMessagesStatus.NotOptedIn else false else false
end