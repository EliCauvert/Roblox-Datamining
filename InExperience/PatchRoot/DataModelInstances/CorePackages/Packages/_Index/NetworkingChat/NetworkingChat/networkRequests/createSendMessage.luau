local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p1)
	-- upvalues: CHAT_URLModule (ref)
	return p1.roduxNetworking.POST({ Name = "SendMessage" }, function(p2, p3, p4, p5)
		-- upvalues: CHAT_URLModule (copy)
		return p2(CHAT_URLModule):path("v2"):path("send-message"):body({ message = p3, conversationId = p4, decorators = p5 }):setStatusIds({ p4 })
	end)
end