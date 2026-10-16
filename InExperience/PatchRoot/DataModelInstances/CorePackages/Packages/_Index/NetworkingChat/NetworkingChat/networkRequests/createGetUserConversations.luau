local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetUserConversations" }, function(Callback, PageNumber, PageSize) --[[ Line: 9 ]]
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("get-user-conversations"):queryArgs({ pageNumber = PageNumber, pageSize = PageSize }):setStatusIds({ PageNumber })
	end)
end