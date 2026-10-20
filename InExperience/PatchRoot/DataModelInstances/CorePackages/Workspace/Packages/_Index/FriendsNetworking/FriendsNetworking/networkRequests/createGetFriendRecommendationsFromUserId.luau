local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1)
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.GET("GetFriendRecommendationsFromUserId", function(Callback, p2)
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule):path("v1"):path("users"):id(p2.targetUserId):path("friends"):path("recommendations"):queryArgs({
			source = p2.source,
			includeProfileFrame = p2.includeProfileFrame
		})
	end)
end