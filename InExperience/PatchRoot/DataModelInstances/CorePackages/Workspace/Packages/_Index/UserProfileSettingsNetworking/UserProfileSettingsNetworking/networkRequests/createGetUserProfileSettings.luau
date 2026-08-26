local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: API_URLModule (ref)
	return p1.roduxNetworking.GET("GetUserProfileSettings", function(p2)
		-- upvalues: API_URLModule (copy)
		return p2(API_URLModule):path("user-profile-api"):path("v1"):path("user"):path("profiles"):path("settings")
	end)
end