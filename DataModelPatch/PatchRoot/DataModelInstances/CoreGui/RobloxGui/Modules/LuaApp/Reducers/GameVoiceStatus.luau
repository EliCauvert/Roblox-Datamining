local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetGameVoiceStatusModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetGameVoiceStatus)

return function(p1, p2)
	-- upvalues: SetGameVoiceStatusModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetGameVoiceStatusModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.universeId] = p2.isUniverseEnabledForVoice })
	end
	return P0
end