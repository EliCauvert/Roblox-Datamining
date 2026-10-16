local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "UpdateUserTypingStatus" }, function(Callback, ConversationId, IsTyping) --[[ Line: 9 ]]
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("update-user-typing-status"):body({ conversationId = ConversationId, isTyping = IsTyping }):setStatusIds({ ConversationId })
	end)
end