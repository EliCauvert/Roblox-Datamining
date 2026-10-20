local GAMESURLModule = require(script.Parent.Parent.GAMES_URL)

return function(p1)
	-- upvalues: GAMESURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetExperiencesProductInfo" }, function(Callback, p2)
		-- upvalues: GAMESURLModule (upval)
		return Callback(GAMESURLModule):path("v1"):path("games"):path("games-product-info"):expandedQueryArgsWithIds("universeIds", p2)
	end)
end