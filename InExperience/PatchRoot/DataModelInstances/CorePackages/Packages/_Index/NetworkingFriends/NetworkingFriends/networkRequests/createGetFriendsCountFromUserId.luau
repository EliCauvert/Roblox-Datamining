local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetFriendsCountFromUserId" }, function(Callback, p2) --[[ Line: 14 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule):path("v1"):path("users"):id(p2):path("friends"):path("count")
	end)
end