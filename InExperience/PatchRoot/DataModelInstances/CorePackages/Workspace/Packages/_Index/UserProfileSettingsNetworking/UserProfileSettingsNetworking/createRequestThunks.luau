local networkRequests = script.Parent.networkRequests
local createGetUserProfileSettingsModule = require(networkRequests.createGetUserProfileSettings)
local createSetUserProfileSettingsModule = require(networkRequests.createSetUserProfileSettings)

return function(p1)
	-- upvalues: createGetUserProfileSettingsModule (ref), createSetUserProfileSettingsModule (ref)
	return {
		GetUserProfileSettings = createGetUserProfileSettingsModule(p1),
		SetUserProfileSettings = createSetUserProfileSettingsModule(p1)
	}
end