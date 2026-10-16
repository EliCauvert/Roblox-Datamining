local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetFriendsFromUserId" }, function(Callback, p2, p3) --[[ Line: 12 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule):path("v1"):path("users"):id(p2):path("friends"):queryArgs({ userSort = p3 and p3.userSort or nil })
	end)
end