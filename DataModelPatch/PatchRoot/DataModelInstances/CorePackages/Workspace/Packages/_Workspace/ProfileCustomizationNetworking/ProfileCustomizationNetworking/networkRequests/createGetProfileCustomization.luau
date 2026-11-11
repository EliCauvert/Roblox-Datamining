local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "GetProfileCustomization" }, function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("profile-platform-api"):path("v1"):path("profiles"):path("customization"):path("get"):body({ profileEntities = { p2.profileEntity } })
	end)
end