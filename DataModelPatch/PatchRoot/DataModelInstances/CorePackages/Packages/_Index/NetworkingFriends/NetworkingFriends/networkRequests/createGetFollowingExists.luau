local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1)
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "GetFollowingExists" }, function(Callback, p2)
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule):path("v1"):path("user"):path("following-exists"):body({ targetUserIds = p2.targetUserIds })
	end)
end