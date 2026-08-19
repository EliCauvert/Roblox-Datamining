local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0) --[[ line: 6 ]]
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.GET("GetExtendedFriendshipStatus", function(p1, p2) --[[ line: 11 ]]
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule):path("v1"):path("my"):path("friends"):id(p2.targetUserId):path("status")
	end)
end