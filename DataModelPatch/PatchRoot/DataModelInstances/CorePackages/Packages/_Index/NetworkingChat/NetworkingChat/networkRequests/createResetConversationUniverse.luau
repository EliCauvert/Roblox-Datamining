local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1)
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "ResetConversationUniverse" }, function(Callback, ConversationId)
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("reset-conversation-universe"):body({ conversationId = ConversationId }):setStatusIds({ ConversationId })
	end)
end