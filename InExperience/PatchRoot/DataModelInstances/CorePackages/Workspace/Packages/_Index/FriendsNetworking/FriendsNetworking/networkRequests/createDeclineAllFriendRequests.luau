local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.POST("DeclineAllFriendRequests", function(Callback, p2) --[[ Line: 9 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule, { currentUserId = p2.currentUserId }):path("v1"):path("user"):path("friend-requests"):path("decline-all"):body({})
	end)
end