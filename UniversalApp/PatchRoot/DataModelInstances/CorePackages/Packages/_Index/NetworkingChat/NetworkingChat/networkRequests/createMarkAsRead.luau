local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p0) --[[ line: 6 ]]
	-- upvalues: CHAT_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "MarkAsRead" }, function(p1, p2, p3) --[[ line: 9 ]]
		-- upvalues: CHAT_URLModule (copy)
		return p1(CHAT_URLModule):path("v2"):path("mark-as-read"):body({ conversationId = p2, endMessageId = p3 }):setStatusIds({ p2 })
	end)
end