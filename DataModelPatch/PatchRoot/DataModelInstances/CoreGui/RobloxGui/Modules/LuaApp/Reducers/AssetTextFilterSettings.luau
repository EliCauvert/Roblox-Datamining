local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetAssetTextFilterSettingsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetAssetTextFilterSettings)

return function(p1, p2)
	-- upvalues: SetAssetTextFilterSettingsModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetAssetTextFilterSettingsModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.universeId] = p2.containsStrongLanguage })
	end
	return P0
end