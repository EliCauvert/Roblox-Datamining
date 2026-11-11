local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local config = {
	[Enum.KeyCode.ButtonL2] = FocusNavigationEventNameEnum.ItemDetailsMoveToTop,
	[Enum.KeyCode.ButtonR2] = FocusNavigationEventNameEnum.ItemDetailsMoveToRecItems
}

return function(p1, p2)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), p2 (copy)
		return {
			[FocusNavigationEventNameEnum.ItemDetailsMoveToTop] = { handler = InputHandlersModule.onRelease(p2.onMoveToTop) },
			[FocusNavigationEventNameEnum.ItemDetailsMoveToRecItems] = {
				handler = InputHandlersModule.onRelease(p2.onMoveToRecItems)
			}
		}
	end, { p2.onMoveToTop, p2.onMoveToRecItems }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end