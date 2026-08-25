local networkRequests = script.Parent.networkRequests
local createGetUserProfileSettingsModule = require(networkRequests.createGetUserProfileSettings)
local createSetUserProfileSettingsModule = require(networkRequests.createSetUserProfileSettings)

return function(p0)
	-- upvalues: createGetUserProfileSettingsModule (ref), createSetUserProfileSettingsModule (ref)
	return {
		GetUserProfileSettings = createGetUserProfileSettingsModule(p0),
		SetUserProfileSettings = createSetUserProfileSettingsModule(p0)
	}
end