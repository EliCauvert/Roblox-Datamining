local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0)
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.GET("GetTencentFriendsSuggestion", function(p1, p2)
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule):path("v1"):path("tecent-friends-suggestion"):queryArgs({
			userOpenId = p2.userOpenId,
			userAccessToken = p2.userAccessToken,
			type = p2.type,
			appType = p2.appType
		})
	end)
end