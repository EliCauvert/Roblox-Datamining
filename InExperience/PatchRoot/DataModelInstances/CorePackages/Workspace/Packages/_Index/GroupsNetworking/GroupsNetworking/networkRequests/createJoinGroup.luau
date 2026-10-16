local GROUPSURLModule = require(script:FindFirstAncestor("GroupsNetworking").GROUPS_URL)

return function(p1) --[[ Line: 14 ]]
	-- upvalues: GROUPSURLModule (copy)
	return p1.roduxNetworking.POST("JoinGroup", function(Callback, p2) --[[ Line: 17 ]]
		-- upvalues: GROUPSURLModule (upval)
		return Callback(GROUPSURLModule):path("v1"):path("groups"):id(p2.groupId):path("users"):body({})
	end)
end