local Parent = script.Parent
local NetworkRequests = Parent.networkRequests
local CreateGetUserSettingsModule = require(NetworkRequests.createGetUserSettings)
local CreateUpdateUserSettingsModule = require(NetworkRequests.createUpdateUserSettings)
local CreateGetUserSettingsMetadataModule = require(NetworkRequests.createGetUserSettingsMetadata)
local _ = require(Parent.Types.networkRequestsTypes)

return function(p1)
	-- upvalues: CreateGetUserSettingsModule (copy), CreateUpdateUserSettingsModule (copy), CreateGetUserSettingsMetadataModule (copy)
	return {
		GetUserSettings = CreateGetUserSettingsModule(p1),
		UpdateUserSettings = CreateUpdateUserSettingsModule(p1),
		GetUserSettingsMetadata = CreateGetUserSettingsMetadataModule(p1)
	}
end