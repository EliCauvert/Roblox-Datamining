local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p1)
	-- upvalues: CHAT_URLModule (ref)
	return p1.roduxNetworking.POST({ Name = "MarkAsRead" }, function(p2, p3, p4)
		-- upvalues: CHAT_URLModule (copy)
		return p2(CHAT_URLModule):path("v2"):path("mark-as-read"):body({ conversationId = p3, endMessageId = p4 }):setStatusIds({ p3 })
	end)
end