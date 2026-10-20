local ArgCheckModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.ArgCheck)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SearchUuid, SearchTime)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isNonEmptyString(SearchUuid, "SetSearchTime: searchUuid")
	ArgCheckModule.isNonNegativeNumber(SearchTime, "SetSearchTime: searchTime")
	
	return { searchUuid = SearchUuid, searchTime = SearchTime }
end)