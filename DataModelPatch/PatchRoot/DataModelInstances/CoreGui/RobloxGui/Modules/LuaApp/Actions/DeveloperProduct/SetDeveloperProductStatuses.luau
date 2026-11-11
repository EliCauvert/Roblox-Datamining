local ArgCheckModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.ArgCheck)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(UniverseId, DeveloperProductStatuses)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(UniverseId, "string", "universeId")
	ArgCheckModule.isType(DeveloperProductStatuses, "table", "developerProductStatusesTable")
	
	return {
		universeId = UniverseId,
		developerProductStatuses = DeveloperProductStatuses
	}
end)