local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Prefix, AutocompleteSuggestions)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Prefix, "string", "Actions.AddAutocompleteSuggestion.prefix")
	ArgCheckModule.isType(AutocompleteSuggestions, "table", "Actions.AddAutocompleteSuggestion.autocompleteSuggestions")
	
	return {
		prefix = Prefix,
		autocompleteSuggestions = AutocompleteSuggestions
	}
end)