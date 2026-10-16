local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.AppChatNetworking)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, ModerationType) --[[ Line: 14 ]]
	return {
		conversationId = ConversationId,
		moderationType = ModerationType
	}
end)