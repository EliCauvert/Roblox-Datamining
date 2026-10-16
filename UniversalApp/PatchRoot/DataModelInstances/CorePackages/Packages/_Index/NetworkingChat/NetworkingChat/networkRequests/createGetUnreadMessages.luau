local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetUnreadMessages" }, function(Callback, p2, PageSize) --[[ Line: 9 ]]
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("get-unread-messages"):queryArgs({ pageSize = PageSize }):expandedQueryArgsWithIds("conversationIds", p2)
	end)
end