local parent = script.Parent
local networkRequests = parent.networkRequests
local createGetUserSettingsModule = require(networkRequests.createGetUserSettings)
local createUpdateUserSettingsModule = require(networkRequests.createUpdateUserSettings)
local createGetUserSettingsMetadataModule = require(networkRequests.createGetUserSettingsMetadata)
local _ = require(parent.Types.networkRequestsTypes)

return function(p0)
	-- upvalues: createGetUserSettingsModule (ref), createUpdateUserSettingsModule (ref), createGetUserSettingsMetadataModule (ref)
	return {
		GetUserSettings = createGetUserSettingsModule(p0),
		UpdateUserSettings = createUpdateUserSettingsModule(p0),
		GetUserSettingsMetadata = createGetUserSettingsMetadataModule(p0)
	}
end