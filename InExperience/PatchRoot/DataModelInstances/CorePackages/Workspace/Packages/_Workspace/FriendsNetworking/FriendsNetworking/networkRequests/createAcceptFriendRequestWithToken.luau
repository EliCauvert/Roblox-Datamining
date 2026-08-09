local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0) --[[ line: 4 ]]
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "AcceptFriendRequestWithToken" }, function(p1, p2) --[[ line: 9 ]]
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule, { currentUserId = p2.currentUserId }):path("v1"):path("users"):id(p2.targetUserId):path("accept-friend-request-with-token"):body({ friendingToken = p2.friendingToken })
	end)
end