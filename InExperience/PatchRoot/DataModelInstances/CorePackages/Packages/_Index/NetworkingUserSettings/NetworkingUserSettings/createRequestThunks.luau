local parent = script.Parent
local networkRequests = parent.networkRequests
local createGetUserSettingsModule = require(networkRequests.createGetUserSettings)
local createUpdateUserSettingsModule = require(networkRequests.createUpdateUserSettings)
local createGetUserSettingsMetadataModule = require(networkRequests.createGetUserSettingsMetadata)
local _ = require(parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: createGetUserSettingsModule (ref), createUpdateUserSettingsModule (ref), createGetUserSettingsMetadataModule (ref)
	return {
		GetUserSettings = createGetUserSettingsModule(p1),
		UpdateUserSettings = createUpdateUserSettingsModule(p1),
		GetUserSettingsMetadata = createGetUserSettingsMetadataModule(p1)
	}
end