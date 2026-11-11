local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(UniverseId, DeveloperProducts)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(UniverseId, "string", "universeId")
	ArgCheckModule.isType(DeveloperProducts, "table", "developerProducts")
	
	return {
		universeId = UniverseId,
		developerProducts = DeveloperProducts
	}
end)