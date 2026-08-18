local GROUPS_URLModule = require(script:FindFirstAncestor("GroupsNetworking").GROUPS_URL)

return function(p0) --[[ line: 14 ]]
	-- upvalues: GROUPS_URLModule (ref)
	return p0.roduxNetworking.POST("MakePrimaryGroup", function(p1, p2) --[[ line: 17 ]]
		-- upvalues: GROUPS_URLModule (copy)
		return p1(GROUPS_URLModule):path("v1"):path("user"):path("groups"):path("primary"):body({ groupId = p2.groupId })
	end)
end