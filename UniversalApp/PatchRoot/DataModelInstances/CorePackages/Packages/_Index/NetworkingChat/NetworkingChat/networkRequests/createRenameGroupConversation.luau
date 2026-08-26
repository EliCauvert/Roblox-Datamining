local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p1)
	-- upvalues: CHAT_URLModule (ref)
	return p1.roduxNetworking.POST({ Name = "RenameGroupConversation" }, function(p2, p3, p4)
		-- upvalues: CHAT_URLModule (copy)
		return p2(CHAT_URLModule):path("v2"):path("rename-group-conversation"):body({ conversationId = p3, newTitle = p4 }):setStatusIds({ p3 })
	end)
end