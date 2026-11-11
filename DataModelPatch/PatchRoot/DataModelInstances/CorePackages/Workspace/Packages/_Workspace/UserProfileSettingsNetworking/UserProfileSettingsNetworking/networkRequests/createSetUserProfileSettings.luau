local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "SetUserProfileSettings" }, function(Callback, p2)
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("user-profile-api"):path("v1"):path("user"):path("profiles"):path("settings"):body({
			userProfileSettings = { isInExperienceNameEnabled = p2.isInExperienceNameEnabled }
		})
	end)
end