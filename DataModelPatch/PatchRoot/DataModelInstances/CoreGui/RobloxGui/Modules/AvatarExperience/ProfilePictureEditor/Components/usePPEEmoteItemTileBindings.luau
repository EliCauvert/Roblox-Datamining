local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local config = {
	[Enum.KeyCode.ButtonA] = FocusNavigationEventNameEnum.SelectItem,
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.OpenItemDetailsPage
}

return function(p1, p2)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), config (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), p1 (copy)
		return {
			[FocusNavigationEventNameEnum.SelectItem] = { handler = InputHandlersModule.onRelease(p1.onSelectItem) },
			[FocusNavigationEventNameEnum.OpenItemDetailsPage] = if p1.onOpenItemDetailsPage then {
				handler = InputHandlersModule.onRelease(p1.onOpenItemDetailsPage)
			} else nil
		}
	end, { p1.onSelectItem, p1.onOpenItemDetailsPage }), (ReactFocusNavigationModule.useEventMap(config, p2)))
end