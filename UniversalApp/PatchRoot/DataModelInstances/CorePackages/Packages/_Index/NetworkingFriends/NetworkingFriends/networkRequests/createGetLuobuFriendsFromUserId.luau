local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0) --[[ line: 5 ]]
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetLuobuFriendsFromUserId" }, function(p1, p2, p3) --[[ line: 8 ]]
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule):path("v1"):path("users"):id(p2):path("luobu-friends"):queryArgs({
			userOpenId = p3.userOpenId,
			userAccessToken = p3.userAccessToken,
			type = p3.type,
			appType = p3.appType
		})
	end)
end