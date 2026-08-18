local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local reactModule = require(avatarExperienceCatalog.Parent.React)
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListBreakPointEnum)
local widgetPanelViewModule = require(script.Parent.WidgetPanelView)
local useWidgetPanelViewModelModule = require(script.Parent.useWidgetPanelViewModel)

return reactModule.memo(function(p0) --[[ line: 20 | named "WidgetPanelContainer" ]]
	-- upvalues: useWidgetPanelViewModelModule (ref), reactModule (ref), widgetPanelViewModule (ref)
	local var4 = useWidgetPanelViewModelModule(p0)
	
	return if var4.status == "visible" then reactModule.createElement(widgetPanelViewModule, var4.viewProps) else nil
end)