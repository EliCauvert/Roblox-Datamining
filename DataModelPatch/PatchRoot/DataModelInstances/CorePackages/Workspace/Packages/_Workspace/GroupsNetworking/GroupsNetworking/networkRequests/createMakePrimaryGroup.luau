local GROUPSURLModule = require(script:FindFirstAncestor("GroupsNetworking").GROUPS_URL)

return function(p1)
	-- upvalues: GROUPSURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "MakePrimaryGroup" }, function(Callback, p2)
		-- upvalues: GROUPSURLModule (upval)
		return Callback(GROUPSURLModule):path("v1"):path("user"):path("groups"):path("primary"):body({ groupId = p2.groupId })
	end)
end