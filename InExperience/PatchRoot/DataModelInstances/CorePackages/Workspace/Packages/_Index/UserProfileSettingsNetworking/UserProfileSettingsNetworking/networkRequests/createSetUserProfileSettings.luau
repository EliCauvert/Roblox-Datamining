local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1) --[[ Line: 12 ]]
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST("SetUserProfileSettings", function(Callback, p2) --[[ Line: 15 ]]
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("user-profile-api"):path("v1"):path("user"):path("profiles"):path("settings"):body({
			userProfileSettings = { isInExperienceNameEnabled = p2.isInExperienceNameEnabled }
		})
	end)
end