local GAMESURLModule = require(script.Parent.Parent.GAMES_URL)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: GAMESURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetExperiencesDetails" }, function(Callback, p2) --[[ Line: 12 ]]
		-- upvalues: GAMESURLModule (upval)
		return Callback(GAMESURLModule):path("v1"):path("games"):expandedQueryArgsWithIds("universeIds", p2)
	end)
end