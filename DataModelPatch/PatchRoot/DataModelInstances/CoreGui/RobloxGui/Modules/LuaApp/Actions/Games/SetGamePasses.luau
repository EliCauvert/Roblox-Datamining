local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(UniverseId, Passes)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(UniverseId, "string", "universeId")
	ArgCheckModule.isType(Passes, "table", "passes")
	
	return { universeId = UniverseId, passes = Passes }
end)