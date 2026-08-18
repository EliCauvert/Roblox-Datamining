local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0) --[[ line: 15 ]]
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.POST("GetProfileCustomization", function(p1, p2) --[[ line: 18 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("profile-platform-api"):path("v1"):path("profiles"):path("customization"):path("get"):body({ profileEntities = { p2.profileEntity } })
	end)
end