local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p0)
	-- upvalues: CHAT_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetUnreadMessages" }, function(p1, p2, p3)
		-- upvalues: CHAT_URLModule (copy)
		return p1(CHAT_URLModule):path("v2"):path("get-unread-messages"):queryArgs({ pageSize = p3 }):expandedQueryArgsWithIds("conversationIds", p2)
	end)
end