local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.GET("GetLuobuFriendsFromUserId", function(Callback, p2, p3) --[[ Line: 9 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule):path("v1"):path("users"):id(p2):path("luobu-friends"):queryArgs({
			userOpenId = p3.userOpenId,
			userAccessToken = p3.userAccessToken,
			type = p3.type,
			appType = p3.appType
		})
	end)
end