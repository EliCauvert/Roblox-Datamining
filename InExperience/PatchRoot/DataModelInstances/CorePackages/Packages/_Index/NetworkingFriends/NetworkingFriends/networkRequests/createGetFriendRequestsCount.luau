local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetFriendRequestsCount" }, function(Callback, _) --[[ Line: 8 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule):path("v1"):path("user"):path("friend-requests"):path("count")
	end)
end