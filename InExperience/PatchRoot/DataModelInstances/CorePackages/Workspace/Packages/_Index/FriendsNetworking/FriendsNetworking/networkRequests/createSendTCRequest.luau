local FRIENDS_URLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1)
	-- upvalues: FRIENDS_URLModule (ref)
	return p1.roduxNetworking.POST("SendTCRequest", function(p2, p3)
		-- upvalues: FRIENDS_URLModule (copy)
		return p2(FRIENDS_URLModule):path("v1"):path("users"):id(p3):path("send-trusted-friend-request"):body({})
	end)
end