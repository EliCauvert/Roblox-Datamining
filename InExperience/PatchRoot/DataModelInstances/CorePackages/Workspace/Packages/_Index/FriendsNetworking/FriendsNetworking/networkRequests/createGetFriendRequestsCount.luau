local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0)
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.GET("GetFriendRequestsCount", function(p1, _)
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule):path("v1"):path("user"):path("friend-requests"):path("count")
	end)
end