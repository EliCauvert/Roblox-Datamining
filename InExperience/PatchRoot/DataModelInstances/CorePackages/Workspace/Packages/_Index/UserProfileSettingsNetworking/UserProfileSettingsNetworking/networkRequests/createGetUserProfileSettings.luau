local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0) --[[ line: 8 ]]
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.GET("GetUserProfileSettings", function(p1) --[[ line: 11 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("user-profile-api"):path("v1"):path("user"):path("profiles"):path("settings")
	end)
end