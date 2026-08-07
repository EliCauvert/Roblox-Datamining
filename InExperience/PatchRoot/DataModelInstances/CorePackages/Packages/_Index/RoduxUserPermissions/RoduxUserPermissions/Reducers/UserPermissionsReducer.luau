local parent = script.Parent.Parent
local types = parent.Types
local isPhoneVerifiedModule = require(parent.Reducers.isPhoneVerified)
local userSettingsModule = require(parent.Reducers.userSettings)
local userSettingsMetadataModule = require(parent.Reducers.userSettingsMetadata)
local _ = require(types.ReducerTypes)
local t = {
	isPhoneVerified = false,
	userSettings = {},
	userSettingsMetadata = {}
}

return function(p0) --[[ line: 15 ]]
	-- upvalues: t (ref), isPhoneVerifiedModule (ref), userSettingsModule (ref), userSettingsMetadataModule (ref)
	return function(p1, p2) --[[ line: 16 ]]
		-- upvalues: t (copy), isPhoneVerifiedModule (copy), p0 (ref), userSettingsModule (copy), userSettingsMetadataModule (copy)
		p1 = p1 or t
		
		return {
			isPhoneVerified = isPhoneVerifiedModule(p0)(p1.isPhoneVerified, p2),
			userSettings = userSettingsModule(p0)(p1.userSettings, p2),
			userSettingsMetadata = userSettingsMetadataModule(p0)(p1.userSettingsMetadata, p2)
		}
	end
end