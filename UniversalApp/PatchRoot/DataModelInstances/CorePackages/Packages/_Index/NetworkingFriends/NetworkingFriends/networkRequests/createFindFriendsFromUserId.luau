local FRIENDSURLModule = require(script.Parent.Parent.FRIENDS_URL)
local _ = require(script.Parent.Parent.networkingFriendsTypes)

return function(p1) --[[ Line: 11 ]]
	-- upvalues: FRIENDSURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "FindFriendsFromUserId" }, function(Callback, p2, p3) --[[ Line: 14 ]]
		-- upvalues: FRIENDSURLModule (upval)
		return Callback(FRIENDSURLModule):path("v1"):path("users"):id(p2):path("friends"):path("find"):queryArgs({
			userSort = if p3 then p3.userSort else nil,
			cursor = if p3 then p3.cursor else nil,
			limit = if p3 then p3.limit else nil
		})
	end)
end