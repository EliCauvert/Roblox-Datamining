local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p0)
	-- upvalues: CHAT_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "SendGameLinkMessage" }, function(p1, p2, p3, p4)
		-- upvalues: CHAT_URLModule (copy)
		return p1(CHAT_URLModule):path("v2"):path("send-game-link-message"):body({ universeId = p2, conversationId = p3, decorators = p4 }):setStatusIds({ p3 })
	end)
end