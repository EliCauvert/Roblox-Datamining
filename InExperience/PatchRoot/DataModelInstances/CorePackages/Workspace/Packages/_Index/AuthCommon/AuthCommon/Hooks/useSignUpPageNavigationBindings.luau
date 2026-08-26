local parent = script:FindFirstAncestor("AuthCommon").Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local fFlagEnableConfirmSignifierOnSignUpPage = require(parent.SharedFlags).FFlagEnableConfirmSignifierOnSignUpPage
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local t = {
	[Enum.KeyCode.ButtonA] = focusNavigationEventNameEnum.Confirm,
	[Enum.KeyCode.Return] = focusNavigationEventNameEnum.Confirm,
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(value)
	-- upvalues: reactModule (ref), fFlagEnableConfirmSignifierOnSignUpPage (ref), reactFocusNavigationModule (ref), t (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref)
	local var1 = reactModule.useCallback(function(p1)
		-- upvalues: value (ref)
		p1:cancel()
		
		if p1.eventData and p1.eventData.KeyCode == Enum.KeyCode.None then return end
		if value then
			value()
		end
	end, if value then { value } else {})
	
	return if fFlagEnableConfirmSignifierOnSignUpPage then reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), var1 (ref), inputHandlersModule (copy)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = var1 },
			[focusNavigationEventNameEnum.Confirm] = {
				handler = inputHandlersModule.onRelease(function() end)
			}
		}
	end, {}), reactFocusNavigationModule.useEventMap(t)) else reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, var1)
end