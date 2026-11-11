local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local config = {
	[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.DisplayStatsAndInfo,
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.Play
}

return function(p1, p2)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), config (copy), ReactFocusNavigationModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), p1 (copy), p2 (copy)
		return {
			[FocusNavigationEventNameEnum.Play] = { handler = InputHandlersModule.onRelease(p1) },
			[FocusNavigationEventNameEnum.DisplayStatsAndInfo] = { handler = InputHandlersModule.onRelease(p2) }
		}
	end, { p1, p2 })
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	
	return ReactFocusNavigationModule.useEventHandlerMap(if UseStateResult then UseMemoResult else {}, (ReactFocusNavigationModule.useEventMap(if UseStateResult then config else {}, (ReactModule.useRef(nil))))), UseStateResult2
end