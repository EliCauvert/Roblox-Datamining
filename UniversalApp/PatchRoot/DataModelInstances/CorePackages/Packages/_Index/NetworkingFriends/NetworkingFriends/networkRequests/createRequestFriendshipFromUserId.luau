local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 19 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "RequestFriendshipFromUserId" }, function(Callback, p2) --[[ Line: 24 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule, { currentUserId = p2.currentUserId }):path("v1"):path("users"):id(p2.targetUserId):path("request-friendship"):body({
			friendshipOriginSourceType = p2.friendshipOriginSourceType,
			senderNickname = p2.senderNickname
		})
	end)
end