local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0) --[[ line: 8 ]]
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.GET("GetFriendsCountFromUserId", function(p1, p2) --[[ line: 11 ]]
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule):path("v1"):path("users"):id(p2):path("friends"):path("count")
	end)
end