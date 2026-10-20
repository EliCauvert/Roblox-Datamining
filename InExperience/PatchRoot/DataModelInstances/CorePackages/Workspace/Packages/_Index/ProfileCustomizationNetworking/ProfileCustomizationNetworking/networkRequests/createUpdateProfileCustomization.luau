local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST("UpdateProfileCustomization", function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("profile-platform-api"):path("v1"):path("profiles"):path("customization"):path("update"):body({
			profileCustomization = {
				profileEntity = p2.profileEntity,
				pinnedComponents = p2.pinnedComponents,
				customizedComponents = p2.customizedComponents
			}
		})
	end)
end