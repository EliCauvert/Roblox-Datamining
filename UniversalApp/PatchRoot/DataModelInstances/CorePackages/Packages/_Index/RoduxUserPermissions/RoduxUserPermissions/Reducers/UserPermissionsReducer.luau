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

return function(p1)
	-- upvalues: t (ref), isPhoneVerifiedModule (ref), userSettingsModule (ref), userSettingsMetadataModule (ref)
	return function(p2, p3)
		-- upvalues: t (copy), isPhoneVerifiedModule (copy), p1 (ref), userSettingsModule (copy), userSettingsMetadataModule (copy)
		p2 = p2 or t
		
		return {
			isPhoneVerified = isPhoneVerifiedModule(p1)(p2.isPhoneVerified, p3),
			userSettings = userSettingsModule(p1)(p2.userSettings, p3),
			userSettingsMetadata = userSettingsMetadataModule(p1)(p2.userSettingsMetadata, p3)
		}
	end
end