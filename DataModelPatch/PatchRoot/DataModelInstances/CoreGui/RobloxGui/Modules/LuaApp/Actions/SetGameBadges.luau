local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)

return require(Modules.Common.Action)(script.Name, function(UniverseId, Badges)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(UniverseId, "string", "universeId")
	ArgCheckModule.isType(Badges, "table", "badges")
	
	return { universeId = UniverseId, badges = Badges }
end)