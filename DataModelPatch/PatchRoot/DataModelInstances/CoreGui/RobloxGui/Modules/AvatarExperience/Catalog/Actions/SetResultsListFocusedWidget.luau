local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(SearchUuid, Id, p1)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isTypeOrNil(Id, "string", "focusedWidgetId expects widget.id")
	ArgCheckModule.isNotNil(p1, "focusedWidgetTemplate")
	
	return {
		searchUuid = SearchUuid,
		id = Id,
		title = p1.title,
		description = p1.description,
		localizedTitle = p1.localizedTitle,
		localizedDescription = p1.localizedDescription,
		localizedTooltip = p1.localizedTooltip,
		tooltip = p1.tooltip
	}
end)