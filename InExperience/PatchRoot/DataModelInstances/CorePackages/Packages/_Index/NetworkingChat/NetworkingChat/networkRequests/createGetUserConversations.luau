local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p1)
	-- upvalues: CHAT_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetUserConversations" }, function(p2, p3, p4)
		-- upvalues: CHAT_URLModule (copy)
		return p2(CHAT_URLModule):path("v2"):path("get-user-conversations"):queryArgs({ pageNumber = p3, pageSize = p4 }):setStatusIds({ p3 })
	end)
end