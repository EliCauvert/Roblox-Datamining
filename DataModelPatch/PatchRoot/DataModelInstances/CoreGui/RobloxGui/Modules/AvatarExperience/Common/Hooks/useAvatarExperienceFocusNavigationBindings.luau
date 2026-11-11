local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local UseOpenQuickMenuCallbackModule = require(script.Parent.useOpenQuickMenuCallback)
local UseQuickMenuAvailableModule = require(script.Parent.useQuickMenuAvailable)
local config = {
	[Enum.KeyCode.ButtonStart] = FocusNavigationEventNameEnum.OpenQuickMenu
}

return function(p1, p2)
	-- upvalues: UseQuickMenuAvailableModule (copy), UseOpenQuickMenuCallbackModule (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), config (copy)
	local UseQuickMenuAvailableModuleResult = UseQuickMenuAvailableModule()
	local UseOpenQuickMenuCallbackModuleResult = UseOpenQuickMenuCallbackModule(p1.overlayClosedCallback)
	
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), UseQuickMenuAvailableModuleResult (copy), InputHandlersModule (upval), UseOpenQuickMenuCallbackModuleResult (copy)
		return {
			[FocusNavigationEventNameEnum.OpenQuickMenu] = {
				handler = if UseQuickMenuAvailableModuleResult then InputHandlersModule.onRelease(UseOpenQuickMenuCallbackModuleResult) else nil
			}
		}
	end, { p1 }), (ReactFocusNavigationModule.useEventMap(config, p2)))
end