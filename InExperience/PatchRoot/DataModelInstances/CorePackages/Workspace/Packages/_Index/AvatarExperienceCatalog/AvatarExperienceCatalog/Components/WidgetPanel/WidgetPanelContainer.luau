local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local ReactModule = require(AvatarExperienceCatalog.Parent.React)
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local WidgetPanelViewModule = require(script.Parent.WidgetPanelView)
local UseWidgetPanelViewModelModule = require(script.Parent.useWidgetPanelViewModel)

return ReactModule.memo(function(p1)
	-- upvalues: UseWidgetPanelViewModelModule (copy), ReactModule (copy), WidgetPanelViewModule (copy)
	local UseWidgetPanelViewModelModuleResult = UseWidgetPanelViewModelModule(p1)
	
	return if UseWidgetPanelViewModelModuleResult.status == "visible" then ReactModule.createElement(WidgetPanelViewModule, UseWidgetPanelViewModelModuleResult.viewProps) else nil
end)