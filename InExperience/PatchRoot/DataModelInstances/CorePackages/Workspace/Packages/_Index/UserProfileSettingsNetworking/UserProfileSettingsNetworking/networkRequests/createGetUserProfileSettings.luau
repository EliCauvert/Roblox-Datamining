local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.GET("GetUserProfileSettings", function(Callback) --[[ Line: 11 ]]
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("user-profile-api"):path("v1"):path("user"):path("profiles"):path("settings")
	end)
end