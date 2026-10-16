local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.POST("SendTCRequest", function(Callback, p2) --[[ Line: 8 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule):path("v1"):path("users"):id(p2):path("send-trusted-friend-request"):body({})
	end)
end