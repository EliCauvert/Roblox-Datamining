local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p0)
	-- upvalues: CHAT_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "StartGroupConversation" }, function(p1, p2, p3)
		-- upvalues: CHAT_URLModule (copy)
		return p1(CHAT_URLModule):path("v2"):path("start-group-conversation"):body({ participantUserIds = p2, title = p3 }):setStatusIds(p2)
	end)
end