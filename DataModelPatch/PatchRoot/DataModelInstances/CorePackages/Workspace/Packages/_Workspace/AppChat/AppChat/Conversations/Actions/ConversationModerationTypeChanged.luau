local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.AppChatNetworking)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, ModerationType)
	return {
		conversationId = ConversationId,
		moderationType = ModerationType
	}
end)