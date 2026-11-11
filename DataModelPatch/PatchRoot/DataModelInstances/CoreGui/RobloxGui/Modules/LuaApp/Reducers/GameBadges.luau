local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetGameBadgesModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetGameBadges)

return function(p1, p2)
	-- upvalues: SetGameBadgesModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetGameBadgesModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.universeId] = p2.badges })
	end
	return P0
end