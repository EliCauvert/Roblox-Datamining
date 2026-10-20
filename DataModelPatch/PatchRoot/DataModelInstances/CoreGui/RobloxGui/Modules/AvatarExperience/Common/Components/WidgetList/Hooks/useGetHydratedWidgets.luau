local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local ReactModule = require(CorePackages.Packages.React)
local GetHydratedWidgetItemsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.WidgetList.Utils.getHydratedWidgetItems)

return function(p1)
	-- upvalues: ReactModule (copy), GetHydratedWidgetItemsModule (copy)
	return (ReactModule.useMemo(function()
		-- upvalues: GetHydratedWidgetItemsModule (upval), p1 (copy)
		return GetHydratedWidgetItemsModule(p1)
	end, {
		p1.hydratedWidgetData,
		p1.widgetInfoDetails,
		p1.selectedWidgetIndex
	}))
end