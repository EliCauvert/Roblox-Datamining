local GROUPS_URLModule = require(script:FindFirstAncestor("GroupsNetworking").GROUPS_URL)

return function(p1)
	-- upvalues: GROUPS_URLModule (ref)
	return p1.roduxNetworking.POST("MakePrimaryGroup", function(p2, p3)
		-- upvalues: GROUPS_URLModule (copy)
		return p2(GROUPS_URLModule):path("v1"):path("user"):path("groups"):path("primary"):body({ groupId = p3.groupId })
	end)
end