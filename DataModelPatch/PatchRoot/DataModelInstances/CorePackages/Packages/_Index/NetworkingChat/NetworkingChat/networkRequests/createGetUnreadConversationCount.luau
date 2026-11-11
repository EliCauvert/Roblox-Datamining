local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1)
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetUnreadConversationCount" }, function(Callback)
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("get-unread-conversation-count")
	end)
end