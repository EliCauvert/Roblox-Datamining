-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:55 2026 Pacific Standard Time.

local parent = script.Parent
local networkRequests = parent.networkRequests
local createGetUserSettingsModule = require(networkRequests.createGetUserSettings)
local createUpdateUserSettingsModule = require(networkRequests.createUpdateUserSettings)
local createGetUserSettingsMetadataModule = require(networkRequests.createGetUserSettingsMetadata)
local _ = require(parent.Types.networkRequestsTypes)

return function(p0) --[[ line: 8 ]]
	-- upvalues: createGetUserSettingsModule (ref), createUpdateUserSettingsModule (ref), createGetUserSettingsMetadataModule (ref)
	return {
		GetUserSettings = createGetUserSettingsModule(p0),
		UpdateUserSettings = createUpdateUserSettingsModule(p0),
		GetUserSettingsMetadata = createGetUserSettingsMetadataModule(p0)
	}
end