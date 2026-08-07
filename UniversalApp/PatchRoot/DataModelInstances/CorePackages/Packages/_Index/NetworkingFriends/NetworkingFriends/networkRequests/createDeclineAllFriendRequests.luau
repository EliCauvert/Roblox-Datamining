local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0) --[[ line: 5 ]]
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "DeclineAllFriendRequests" }, function(p1, p2) --[[ line: 8 ]]
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule, { currentUserId = p2.currentUserId }):path("v1"):path("user"):path("friend-requests"):path("decline-all"):body({})
	end)
end