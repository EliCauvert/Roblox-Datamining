local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0) --[[ line: 4 ]]
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.GET("GetFriendRecommendationsFromUserId", function(p1, p2) --[[ line: 9 ]]
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule):path("v1"):path("users"):id(p2.targetUserId):path("friends"):path("recommendations"):queryArgs({
			source = p2.source,
			includeProfileFrame = p2.includeProfileFrame
		})
	end)
end