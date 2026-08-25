local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p0)
	-- upvalues: CHAT_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "StartOneToOneConversation" }, function(p1, p2)
		-- upvalues: CHAT_URLModule (copy)
		return p1(CHAT_URLModule):path("v2"):path("start-one-to-one-conversation"):body({ participantUserId = p2 }):setStatusIds({ p2 })
	end)
end