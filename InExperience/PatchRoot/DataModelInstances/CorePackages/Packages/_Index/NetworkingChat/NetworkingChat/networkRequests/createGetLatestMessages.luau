local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1)
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetLatestMessages" }, function(Callback, p2, PageSize)
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("multi-get-latest-messages"):queryArgs({ pageSize = PageSize }):expandedQueryArgsWithIds("conversationIds", p2)
	end)
end