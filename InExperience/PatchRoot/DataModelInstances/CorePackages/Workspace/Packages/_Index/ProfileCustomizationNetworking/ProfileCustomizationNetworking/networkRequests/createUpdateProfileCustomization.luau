local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1) --[[ Line: 30 ]]
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST("UpdateProfileCustomization", function(Callback, p2) --[[ Line: 33 ]]
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