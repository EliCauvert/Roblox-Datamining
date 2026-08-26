local GAMES_URLModule = require(script.Parent.Parent.GAMES_URL)

return function(p1)
	-- upvalues: GAMES_URLModule (ref)
	return p1.roduxNetworking.GET({ Name = "GetExperiencesDetails" }, function(p2, p3)
		-- upvalues: GAMES_URLModule (copy)
		return p2(GAMES_URLModule):path("v1"):path("games"):expandedQueryArgsWithIds("universeIds", p3)
	end)
end