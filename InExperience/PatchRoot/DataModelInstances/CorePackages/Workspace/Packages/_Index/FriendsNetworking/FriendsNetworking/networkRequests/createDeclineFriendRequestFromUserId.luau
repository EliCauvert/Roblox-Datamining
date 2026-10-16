local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.POST("DeclineFriendRequesterUserId", function(Callback, p2) --[[ Line: 9 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule, { currentUserId = p2.currentUserId }):path("v1"):path("users"):id(p2.targetUserId):path("decline-friend-request"):body({})
	end)
end