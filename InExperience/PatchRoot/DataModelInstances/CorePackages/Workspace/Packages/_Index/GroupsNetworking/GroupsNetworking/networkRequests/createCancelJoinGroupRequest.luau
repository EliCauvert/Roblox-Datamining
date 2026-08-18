local GROUPS_URLModule = require(script:FindFirstAncestor("GroupsNetworking").GROUPS_URL)

return function(p0) --[[ line: 15 ]]
	-- upvalues: GROUPS_URLModule (ref)
	return p0.roduxNetworking.DELETE("CancelJoinGroupRequest", function(p1, p2) --[[ line: 18 ]]
		-- upvalues: GROUPS_URLModule (copy)
		return p1(GROUPS_URLModule):path("v1"):path("groups"):id(p2.groupId):path("join-requests"):path("users"):id(p2.userId)
	end)
end