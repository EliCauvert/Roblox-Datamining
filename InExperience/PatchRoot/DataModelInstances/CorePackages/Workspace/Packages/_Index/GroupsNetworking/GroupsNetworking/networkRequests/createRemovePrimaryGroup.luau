local GROUPSURLModule = require(script:FindFirstAncestor("GroupsNetworking").GROUPS_URL)

return function(p1) --[[ Line: 10 ]]
	-- upvalues: GROUPSURLModule (copy)
	return p1.roduxNetworking.DELETE("RemovePrimaryGroup", function(Callback) --[[ Line: 13 ]]
		-- upvalues: GROUPSURLModule (upval)
		return Callback(GROUPSURLModule):path("v1"):path("user"):path("groups"):path("primary")
	end)
end