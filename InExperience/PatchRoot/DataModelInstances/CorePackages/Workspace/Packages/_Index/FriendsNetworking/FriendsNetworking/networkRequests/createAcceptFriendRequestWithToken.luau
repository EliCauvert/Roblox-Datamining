local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.POST("AcceptFriendRequestWithToken", function(Callback, p2) --[[ Line: 9 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule, { currentUserId = p2.currentUserId }):path("v1"):path("users"):id(p2.targetUserId):path("accept-friend-request-with-token"):body({ friendingToken = p2.friendingToken })
	end)
end