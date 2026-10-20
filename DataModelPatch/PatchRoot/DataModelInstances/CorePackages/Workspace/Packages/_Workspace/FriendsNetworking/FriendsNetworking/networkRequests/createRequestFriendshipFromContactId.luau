local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1)
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "RequestFriendshipFromContactId" }, function(Callback, p2)
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule, { currentUserId = p2.currentUserId }):path("v1"):path("contacts"):id(p2.contactId):path("request-friendship"):body({})
	end)
end