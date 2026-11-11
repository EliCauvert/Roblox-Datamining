local DashModule = require(game:GetService("CorePackages").Packages.Dash)
local SetGamePrivateServersEnabledModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Games.SetGamePrivateServersEnabled)

return function(p1, p2)
	-- upvalues: SetGamePrivateServersEnabledModule (copy), DashModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetGamePrivateServersEnabledModule.name then
		P0 = DashModule.assign(P0, { [p2.universeId] = p2.privateServersEnabled })
	end
	return P0
end