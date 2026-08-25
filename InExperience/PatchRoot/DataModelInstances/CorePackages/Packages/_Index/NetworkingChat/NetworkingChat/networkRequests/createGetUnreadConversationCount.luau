local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p0)
	-- upvalues: CHAT_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetUnreadConversationCount" }, function(p1)
		-- upvalues: CHAT_URLModule (copy)
		return p1(CHAT_URLModule):path("v2"):path("get-unread-conversation-count")
	end)
end