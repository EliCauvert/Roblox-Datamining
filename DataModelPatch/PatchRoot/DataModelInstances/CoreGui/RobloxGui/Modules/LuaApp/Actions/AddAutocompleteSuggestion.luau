local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Prefix, AutocompleteSuggestion)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Prefix, "string", "Actions.AddAutocompleteSuggestion.prefix")
	ArgCheckModule.isType(AutocompleteSuggestion, "table", "Actions.AddAutocompleteSuggestion.autocompleteSuggestion")
	
	return {
		prefix = Prefix,
		autocompleteSuggestion = AutocompleteSuggestion
	}
end)