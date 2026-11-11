local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1)
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "MarkAsRead" }, function(Callback, ConversationId, EndMessageId)
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("mark-as-read"):body({
			conversationId = ConversationId,
			endMessageId = EndMessageId
		}):setStatusIds({ ConversationId })
	end)
end