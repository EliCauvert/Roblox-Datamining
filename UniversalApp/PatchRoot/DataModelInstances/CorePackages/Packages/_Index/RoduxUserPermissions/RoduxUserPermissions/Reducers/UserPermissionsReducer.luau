local Parent = script.Parent.Parent
local IsPhoneVerifiedModule = require(Parent.Reducers.isPhoneVerified)
local UserSettingsModule = require(Parent.Reducers.userSettings)
local UserSettingsMetadataModule = require(Parent.Reducers.userSettingsMetadata)
local _ = require(Parent.Types.ReducerTypes)
local config = {
	isPhoneVerified = false,
	userSettings = {},
	userSettingsMetadata = {}
}

return function(p1) --[[ Line: 15 ]]
	-- upvalues: config (copy), IsPhoneVerifiedModule (copy), UserSettingsModule (copy), UserSettingsMetadataModule (copy)
	return function(p2, p3) --[[ Line: 16 ]]
		-- upvalues: config (upval), IsPhoneVerifiedModule (upval), p1 (copy), UserSettingsModule (upval), UserSettingsMetadataModule (upval)
		local P1 = p2 or config
		
		return {
			isPhoneVerified = IsPhoneVerifiedModule(p1)(P1.isPhoneVerified, p3),
			userSettings = UserSettingsModule(p1)(P1.userSettings, p3),
			userSettingsMetadata = UserSettingsMetadataModule(p1)(P1.userSettingsMetadata, p3)
		}
	end
end