local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), p2 (copy), InputHandlersModule (upval)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = if p2.onNavigateBack then {
				handler = InputHandlersModule.onRelease(p2.onNavigateBack)
			} else nil,
			[FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = if p2.onOpenBuyItemPrompt then {
				handler = InputHandlersModule.onRelease(p2.onOpenBuyItemPrompt)
			} else nil,
			[FocusNavigationEventNameEnum.OpenQuickMenu] = if p2.onOpenQuickMenu then {
				handler = InputHandlersModule.onRelease(p2.onOpenQuickMenu)
			} else nil,
			[FocusNavigationEventNameEnum.OpenCatalogContextMenu] = if p2.onOpenContextMenu then {
				handler = InputHandlersModule.onRelease(p2.onOpenContextMenu)
			} else nil,
			[FocusNavigationEventNameEnum.ToggleTryOnManager] = if p2.onToggleTryOnManager then {
				handler = InputHandlersModule.onRelease(p2.onToggleTryOnManager)
			} else nil,
			[FocusNavigationEventNameEnum.Search] = if p2.onToggleSearch then {
				handler = InputHandlersModule.onRelease(p2.onToggleSearch)
			} else nil
		}
	end, {
		p2.onNavigateBack, p2.onOpenBuyItemPrompt, p2.onOpenQuickMenu,
		p2.onOpenContextMenu, p2.onToggleTryOnManager, p2.onToggleSearch
	}), (ReactFocusNavigationModule.useEventMap(p1, p3)))
end