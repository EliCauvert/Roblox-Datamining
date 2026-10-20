local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetSearchTimeModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetSearchTime)

return function(p1, p2)
	-- upvalues: SetSearchTimeModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetSearchTimeModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.searchUuid] = p2.searchTime })
	end
	return P0
end