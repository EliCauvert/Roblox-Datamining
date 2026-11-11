local AppChat = script:FindFirstAncestor("AppChat")
local ConversationModule = require(AppChat.Models.Conversation)
local FFlagAppChatEnableU13ChatOptIn = require(AppChat.Parent.SharedFlags).FFlagAppChatEnableU13ChatOptIn

return function(p1): boolean
	-- upvalues: FFlagAppChatEnableU13ChatOptIn (copy), ConversationModule (copy)
	return if FFlagAppChatEnableU13ChatOptIn and p1 then p1.userOptedIntoChatMessages == ConversationModule.UserOptedIntoChatMessagesStatus.NotOptedIn else false
end