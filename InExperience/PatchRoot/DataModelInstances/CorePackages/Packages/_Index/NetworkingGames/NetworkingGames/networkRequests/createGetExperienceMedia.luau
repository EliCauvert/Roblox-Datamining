local GAMES_URLModule = require(script.Parent.Parent.GAMES_URL)

return function(p0)
	-- upvalues: GAMES_URLModule (ref)
	return p0.roduxNetworking.GET({ Name = "GetExperienceMedia" }, function(p1, p2)
		-- upvalues: GAMES_URLModule (copy)
		return p1(GAMES_URLModule):path("v2"):path("games"):id(p2):path("media")
	end)
end