local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1) --[[ Line: 15 ]]
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST("GetProfileCustomization", function(Callback, p2) --[[ Line: 18 ]]
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("profile-platform-api"):path("v1"):path("profiles"):path("customization"):path("get"):body({ profileEntities = { p2.profileEntity } })
	end)
end