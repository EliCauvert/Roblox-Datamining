local parent = script.Parent.Parent
local _ = require(parent.networkingChatTypes)
local CHAT_URLModule = require(parent.CHAT_URL)

return function(p1)
	-- upvalues: CHAT_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetMessages" }, function(p2, p3, p4, p5)
		-- upvalues: CHAT_URLModule (copy)
		return p2(CHAT_URLModule):path("v2"):path("get-messages"):queryArgs({
			conversationId = p3,
			pageSize = p4,
			exclusiveStartMessageId = p5
		}):setStatusIds({ p3 })
	end)
end