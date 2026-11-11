local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetDeveloperProductStatusesModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.DeveloperProduct.SetDeveloperProductStatuses)

return function(p1, p2)
	-- upvalues: SetDeveloperProductStatusesModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetDeveloperProductStatusesModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.universeId] = p2.developerProductStatuses })
	end
	return P0
end