local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.GET("GetNewFriendRequestsCount", function(Callback, p2) --[[ Line: 14 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule, { currentUserId = p2.currentUserId }):path("v1"):path("my"):path("new-friend-requests"):path("count")
	end)
end