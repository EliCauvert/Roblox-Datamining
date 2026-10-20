local GROUPSURLModule = require(script:FindFirstAncestor("GroupsNetworking").GROUPS_URL)

return function(p1)
	-- upvalues: GROUPSURLModule (copy)
	return p1.roduxNetworking.DELETE("LeaveGroup", function(Callback, p2)
		-- upvalues: GROUPSURLModule (upval)
		return Callback(GROUPSURLModule):path("v1"):path("groups"):id(p2.groupId):path("users"):id(p2.userId)
	end)
end