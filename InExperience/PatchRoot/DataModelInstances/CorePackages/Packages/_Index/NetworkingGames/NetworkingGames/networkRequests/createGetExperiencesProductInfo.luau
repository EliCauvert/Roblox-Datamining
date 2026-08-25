local GAMES_URLModule = require(script.Parent.Parent.GAMES_URL)

return function(p0)
	-- upvalues: GAMES_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetExperiencesProductInfo" }, function(p1, p2)
		-- upvalues: GAMES_URLModule (copy)
		return p1(GAMES_URLModule):path("v1"):path("games"):path("games-product-info"):expandedQueryArgsWithIds("universeIds", p2)
	end)
end