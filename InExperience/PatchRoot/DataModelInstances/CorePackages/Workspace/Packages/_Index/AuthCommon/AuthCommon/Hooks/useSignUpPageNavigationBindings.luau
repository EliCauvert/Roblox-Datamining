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

return function(value) --[[ line: 20 | named "useSignUpPageNavigationBindings" ]]
	-- upvalues: reactModule (ref), fFlagEnableConfirmSignifierOnSignUpPage (ref), reactFocusNavigationModule (ref), t (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref)
	local var5 = reactModule.useCallback(function(p0) --[[ line: 22 ]]
		-- upvalues: value (ref)
		p0:cancel()
		
		if p0.eventData and p0.eventData.KeyCode == Enum.KeyCode.None then return end
		if value then
			value()
		end
	end, if value then { value } else {})
	
	return if fFlagEnableConfirmSignifierOnSignUpPage then reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function() --[[ line: 35 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), var5 (ref), inputHandlersModule (copy)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = var5 },
			[focusNavigationEventNameEnum.Confirm] = {
				handler = inputHandlersModule.onRelease(function() --[[ line: 41 ]] end)
			}
		}
	end, {}), reactFocusNavigationModule.useEventMap(t)) else reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, var5)
end