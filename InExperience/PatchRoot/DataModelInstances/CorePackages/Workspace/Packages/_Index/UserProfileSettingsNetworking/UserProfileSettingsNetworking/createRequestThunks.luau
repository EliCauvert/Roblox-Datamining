local NetworkRequests = script.Parent.networkRequests
local CreateGetUserProfileSettingsModule = require(NetworkRequests.createGetUserProfileSettings)
local CreateSetUserProfileSettingsModule = require(NetworkRequests.createSetUserProfileSettings)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: CreateGetUserProfileSettingsModule (copy), CreateSetUserProfileSettingsModule (copy)
	return {
		GetUserProfileSettings = CreateGetUserProfileSettingsModule(p1),
		SetUserProfileSettings = CreateSetUserProfileSettingsModule(p1)
	}
end