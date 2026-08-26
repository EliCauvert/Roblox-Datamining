local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1)
	-- upvalues: FRIENDS_URLModule (ref)
	return p1.roduxNetworking.POST({ Name = "AcceptFriendRequestFromUserId" }, function(p2, p3)
		-- upvalues: FRIENDS_URLModule (copy)
		return p2(FRIENDS_URLModule, { currentUserId = p3.currentUserId }):path("v1"):path("users"):id(p3.targetUserId):path("accept-friend-request"):body({})
	end)
end