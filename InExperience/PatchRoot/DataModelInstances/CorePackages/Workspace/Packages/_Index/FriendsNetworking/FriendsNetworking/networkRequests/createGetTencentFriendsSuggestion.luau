local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1)
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.GET("GetTencentFriendsSuggestion", function(Callback, p2)
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule):path("v1"):path("tecent-friends-suggestion"):queryArgs({
			userOpenId = p2.userOpenId,
			userAccessToken = p2.userAccessToken,
			type = p2.type,
			appType = p2.appType
		})
	end)
end