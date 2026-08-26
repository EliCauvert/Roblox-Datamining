local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1)
	-- upvalues: FRIENDS_URLModule (ref)
	return p1.roduxNetworking.GET("GetFriendshipStatuses", function(p2, p3)
		-- upvalues: FRIENDS_URLModule (copy)
		return p2(FRIENDS_URLModule):path("v1"):path("users"):id(p3.currentUserId):path("friends"):path("statuses"):expandedQueryArgsWithIds("userIds", p3.targetUserIds)
	end)
end