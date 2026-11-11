local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.ButtonStart] = FocusNavigationEventNameEnum.OpenQuickMenu,
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt,
	[Enum.KeyCode.ButtonL3] = FocusNavigationEventNameEnum.OpenCatalogContextMenu
}

return function(p1, p2)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), config (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), p1 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(p1.onNavigateBack)
			},
			[FocusNavigationEventNameEnum.OpenBuyCatalogItemPrompt] = if p1.onOpenBuyItemPrompt then {
				handler = InputHandlersModule.onRelease(p1.onOpenBuyItemPrompt)
			} else nil,
			[FocusNavigationEventNameEnum.OpenQuickMenu] = if p1.onOpenQuickMenu then {
				handler = InputHandlersModule.onRelease(p1.onOpenQuickMenu)
			} else nil,
			[FocusNavigationEventNameEnum.OpenCatalogContextMenu] = if p1.onOpenContextMenu then {
				handler = InputHandlersModule.onRelease(p1.onOpenContextMenu)
			} else nil
		}
	end, {
		p1.onNavigateBack,
		p1.onOpenBuyItemPrompt,
		p1.onOpenQuickMenu,
		p1.onOpenContextMenu
	}), (ReactFocusNavigationModule.useEventMap(config, p2)))
end