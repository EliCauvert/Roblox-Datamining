local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetGamePassesModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Games.SetGamePasses)

return function(p1, p2)
	-- upvalues: SetGamePassesModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetGamePassesModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.universeId] = p2.passes })
	end
	return P0
end