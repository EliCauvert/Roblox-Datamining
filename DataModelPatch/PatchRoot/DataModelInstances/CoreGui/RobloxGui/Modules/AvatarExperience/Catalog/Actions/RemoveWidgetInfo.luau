local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(WidgetId)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(WidgetId, "string", "RemoveWidgetInfo expects widgetId")
	
	return { widgetId = WidgetId }
end)