local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: API_URLModule (ref)
	return p1.roduxNetworking.POST("UpdateProfileCustomization", function(p2, p3)
		-- upvalues: API_URLModule (copy)
		return p2(API_URLModule):path("profile-platform-api"):path("v1"):path("profiles"):path("customization"):path("update"):body({
			profileCustomization = {
				profileEntity = p3.profileEntity,
				pinnedComponents = p3.pinnedComponents,
				customizedComponents = p3.customizedComponents
			}
		})
	end)
end