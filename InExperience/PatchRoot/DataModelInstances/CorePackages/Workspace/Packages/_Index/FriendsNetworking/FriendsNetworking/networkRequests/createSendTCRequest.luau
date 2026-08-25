local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p0)
	-- upvalues: FRIENDS_URLModule (ref)
	return p0.roduxNetworking.POST("SendTCRequest", function(p1, p2)
		-- upvalues: FRIENDS_URLModule (copy)
		return p1(FRIENDS_URLModule):path("v1"):path("users"):id(p2):path("send-trusted-friend-request"):body({})
	end)
end