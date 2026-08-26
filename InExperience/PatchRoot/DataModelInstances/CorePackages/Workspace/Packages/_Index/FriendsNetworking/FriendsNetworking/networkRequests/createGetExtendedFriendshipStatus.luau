local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1)
	-- upvalues: FRIENDS_URLModule (ref)
	return p1.roduxNetworking.GET("GetExtendedFriendshipStatus", function(p2, p3)
		-- upvalues: FRIENDS_URLModule (copy)
		return p2(FRIENDS_URLModule):path("v1"):path("my"):path("friends"):id(p3.targetUserId):path("status")
	end)
end