local GROUPSURLModule = require(script:FindFirstAncestor("GroupsNetworking").GROUPS_URL)

return function(p1) --[[ Line: 15 ]]
	-- upvalues: GROUPSURLModule (copy)
	return p1.roduxNetworking.DELETE("CancelJoinGroupRequest", function(Callback, p2) --[[ Line: 18 ]]
		-- upvalues: GROUPSURLModule (upval)
		return Callback(GROUPSURLModule):path("v1"):path("groups"):id(p2.groupId):path("join-requests"):path("users"):id(p2.userId)
	end)
end