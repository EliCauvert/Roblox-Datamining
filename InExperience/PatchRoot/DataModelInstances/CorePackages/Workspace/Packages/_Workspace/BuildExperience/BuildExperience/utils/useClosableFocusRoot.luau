local parent = script:FindFirstAncestor("BuildExperience").Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), t (ref)
	local onClose = p1.onClose
	
	return useFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = p1.surfaceIdentifier,
		isFocusable = p1.isOpen,
		shouldRestoreFocus = p1.shouldRestoreFocus,
		eventMap = t,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), onClose (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: onClose (copy)
						onClose()
						p2:cancel()
					end)
				}
			}
		end, { onClose })
	})
end