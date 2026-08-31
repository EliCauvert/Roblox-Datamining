local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local reactModule = require(avatarExperienceCatalog.Parent.React)
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local widgetPanelViewModule = require(script.Parent.WidgetPanelView)
local useWidgetPanelViewModelModule = require(script.Parent.useWidgetPanelViewModel)

return reactModule.memo(function(p1)
	-- upvalues: useWidgetPanelViewModelModule (ref), reactModule (ref), widgetPanelViewModule (ref)
	local var1 = useWidgetPanelViewModelModule(p1)
	
	return if var1.status == "visible" then reactModule.createElement(widgetPanelViewModule, var1.viewProps) else nil
end)