local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1) --[[ Line: 30 | Named "useClosableFocusRoot" ]]
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), EventMap (copy)
	local OnCloseFunction = p1.onClose
	
	return UseFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = p1.surfaceIdentifier,
		isFocusable = p1.isOpen,
		shouldRestoreFocus = p1.shouldRestoreFocus,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function() --[[ Line: 32 ]]
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCloseFunction (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 35 ]]
						-- upvalues: OnCloseFunction (upval)
						OnCloseFunction()
						p2:cancel()
					end)
				}
			}
		end, { OnCloseFunction })
	})
end