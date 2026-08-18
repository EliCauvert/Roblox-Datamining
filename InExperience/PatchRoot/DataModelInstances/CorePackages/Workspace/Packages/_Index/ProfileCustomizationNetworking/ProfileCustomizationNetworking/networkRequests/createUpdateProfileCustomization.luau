local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0) --[[ line: 30 ]]
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.POST({ Name = "UpdateProfileCustomization" }, function(p1, p2) --[[ line: 33 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("profile-platform-api"):path("v1"):path("profiles"):path("customization"):path("update"):body({
			profileCustomization = {
				profileEntity = p2.profileEntity,
				pinnedComponents = p2.pinnedComponents,
				customizedComponents = p2.customizedComponents
			}
		})
	end)
end