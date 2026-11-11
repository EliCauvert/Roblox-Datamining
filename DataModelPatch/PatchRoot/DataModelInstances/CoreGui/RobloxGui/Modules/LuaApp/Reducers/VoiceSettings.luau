local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetVoiceSettingsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetVoiceSettings)

return function(p1, p2)
	-- upvalues: SetVoiceSettingsModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetVoiceSettingsModule.name then
		P0 = CryoModule.Dictionary.join(P0, {
			isUserEligible = p2.isUserEligible,
			isVoiceEnabled = p2.isVoiceEnabled,
			isUserOptIn = p2.isUserOptIn
		})
	end
	return P0
end