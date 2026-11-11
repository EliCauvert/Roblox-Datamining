local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(SuggestionTable)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(SuggestionTable, "table", "Actions.AddAutocompleteSuggestionTable.suggestionTable")
	
	return { suggestionTable = SuggestionTable }
end)