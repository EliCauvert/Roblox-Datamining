local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetGameDeveloperProductsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.DeveloperProduct.SetGameDeveloperProducts)

return function(p1, p2)
	-- upvalues: SetGameDeveloperProductsModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetGameDeveloperProductsModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.universeId] = p2.developerProducts })
	end
	return P0
end