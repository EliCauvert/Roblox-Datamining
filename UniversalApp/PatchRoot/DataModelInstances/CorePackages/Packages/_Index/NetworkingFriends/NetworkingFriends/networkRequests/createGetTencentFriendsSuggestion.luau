local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1)
	-- upvalues: FRIENDS_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetTencentFriendsSuggestion" }, function(p2, p3)
		-- upvalues: FRIENDS_URLModule (copy)
		return p2(FRIENDS_URLModule):path("v1"):path("tecent-friends-suggestion"):queryArgs({
			userOpenId = p3.userOpenId,
			userAccessToken = p3.userAccessToken,
			type = p3.type,
			appType = p3.appType
		})
	end)
end