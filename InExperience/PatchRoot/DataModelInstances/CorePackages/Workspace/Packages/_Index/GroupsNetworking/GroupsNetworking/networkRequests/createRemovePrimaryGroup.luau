local GROUPS_URLModule = require(script:FindFirstAncestor("GroupsNetworking").GROUPS_URL)

return function(p0) --[[ line: 10 ]]
	-- upvalues: GROUPS_URLModule (ref)
	return p0.roduxNetworking.DELETE("RemovePrimaryGroup", function(p1) --[[ line: 13 ]]
		-- upvalues: GROUPS_URLModule (copy)
		return p1(GROUPS_URLModule):path("v1"):path("user"):path("groups"):path("primary")
	end)
end