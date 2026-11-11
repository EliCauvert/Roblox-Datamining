local CrossPlay = script:FindFirstAncestor("CrossPlay")
local CreateGetUserSettingsPlatformModule = require(CrossPlay.Networking.networkRequests.createGetUserSettingsPlatform)
local CreateUpdateUserSettingsPlatformModule = require(CrossPlay.Networking.networkRequests.createUpdateUserSettingsPlatform)

return function(p1)
	-- upvalues: CreateGetUserSettingsPlatformModule (copy), CreateUpdateUserSettingsPlatformModule (copy)
	return {
		GetUserSettingsPlatform = CreateGetUserSettingsPlatformModule(p1),
		UpdateUserSettingsPlatform = CreateUpdateUserSettingsPlatformModule(p1)
	}
end