local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.AppChatNetworking)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, ModalVariant)
	return {
		conversationId = ConversationId,
		modalVariant = ModalVariant
	}
end)