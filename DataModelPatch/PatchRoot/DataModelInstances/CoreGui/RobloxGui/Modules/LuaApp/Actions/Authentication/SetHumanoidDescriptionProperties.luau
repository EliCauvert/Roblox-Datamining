local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)

return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)(script.Name, function(TableOfHumanoidDescriptionProperties)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(TableOfHumanoidDescriptionProperties, "table", "tableOfHumanoidDescriptionProperties passed into SetHumanoidDescriptionProperties")
	
	for i, tableOfHumanoidDescriptionProperty in pairs(TableOfHumanoidDescriptionProperties) do
		ArgCheckModule.isNonEmptyString(i, "tableOfHumanoidDescriptionProperties's key (outfitId)")
		ArgCheckModule.isType(tableOfHumanoidDescriptionProperty, "table", "tableOfHumanoidDescriptionProperties's value (table of HumanoidDescription properties)")
	end
	return {
		tableOfHumanoidDescriptionProperties = TableOfHumanoidDescriptionProperties
	}
end)