local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0)
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.POST("SetUserProfileSettings", function(p1, p2)
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("user-profile-api"):path("v1"):path("user"):path("profiles"):path("settings"):body({
			userProfileSettings = { isInExperienceNameEnabled = p2.isInExperienceNameEnabled }
		})
	end)
end