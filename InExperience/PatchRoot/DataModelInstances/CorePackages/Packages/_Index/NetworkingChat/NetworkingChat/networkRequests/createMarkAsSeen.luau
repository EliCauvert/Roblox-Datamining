local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1)
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "MarkAsSeen" }, function(Callback, ConversationsToMarkSeen)
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("mark-as-seen"):body({ conversationsToMarkSeen = ConversationsToMarkSeen }):setStatusIds(ConversationsToMarkSeen)
	end)
end