local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 10 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetLuobuFriendRequests" }, function(Callback, p2) --[[ Line: 13 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule):path("v1"):path("my"):path("luobu-friends"):path("requests"):queryArgs({
			userOpenId = p2.userOpenId,
			userAccessToken = p2.userAccessToken,
			type = p2.type,
			appType = p2.appType,
			sortOrder = p2.sortOrder,
			limit = p2.limit,
			cursor = p2.cursor
		})
	end)
end