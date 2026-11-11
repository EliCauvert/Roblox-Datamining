local GAMESURLModule = require(script.Parent.Parent.GAMES_URL)

return function(p1)
	-- upvalues: GAMESURLModule (copy)
	return p1.roduxNetworking.GET({ Name = "GetExperienceMedia" }, function(Callback, p2)
		-- upvalues: GAMESURLModule (upval)
		return Callback(GAMESURLModule):path("v2"):path("games"):id(p2):path("media")
	end)
end