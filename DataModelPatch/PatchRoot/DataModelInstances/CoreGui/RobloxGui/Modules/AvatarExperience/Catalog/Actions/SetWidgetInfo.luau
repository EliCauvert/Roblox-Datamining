local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(WidgetInfo, RequestId, Query, Context, Configuration)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(WidgetInfo, "table", "SetWidgetInfo expects widgetInfo")
	
	return {
		widgetInfo = WidgetInfo,
		requestId = RequestId,
		query = Query,
		context = Context,
		configuration = Configuration
	}
end)