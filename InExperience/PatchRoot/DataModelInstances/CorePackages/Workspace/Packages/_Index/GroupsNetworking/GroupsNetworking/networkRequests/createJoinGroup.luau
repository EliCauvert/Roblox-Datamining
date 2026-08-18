local GROUPS_URLModule = require(script:FindFirstAncestor("GroupsNetworking").GROUPS_URL)

return function(p0) --[[ line: 14 ]]
	-- upvalues: GROUPS_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "JoinGroup" }, function(p1, p2) --[[ line: 17 ]]
		-- upvalues: GROUPS_URLModule (copy)
		return p1(GROUPS_URLModule):path("v1"):path("groups"):id(p2.groupId):path("users"):body({})
	end)
end