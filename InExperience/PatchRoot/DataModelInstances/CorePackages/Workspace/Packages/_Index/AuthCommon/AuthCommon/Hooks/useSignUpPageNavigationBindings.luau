local Parent = script:FindFirstAncestor("AuthCommon").Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local FFlagEnableConfirmSignifierOnSignUpPage = require(Parent.SharedFlags).FFlagEnableConfirmSignifierOnSignUpPage
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local config = {
	[Enum.KeyCode.ButtonA] = FocusNavigationEventNameEnum.Confirm,
	[Enum.KeyCode.Return] = FocusNavigationEventNameEnum.Confirm,
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(Callback) --[[ Line: 20 | Named "useSignUpPageNavigationBindings" ]]
	-- upvalues: ReactModule (copy), FFlagEnableConfirmSignifierOnSignUpPage (copy), ReactFocusNavigationModule (copy), config (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	local UseResult = ReactModule.useCallback(function(p1) --[[ Line: 22 ]]
		-- upvalues: Callback (copy)
		p1:cancel()
		
		if p1.eventData and p1.eventData.KeyCode == Enum.KeyCode.None then return end
		if Callback then
			Callback()
		end
	end, if Callback then { Callback } else {})
	
	return if FFlagEnableConfirmSignifierOnSignUpPage then ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function() --[[ Line: 35 ]]
		-- upvalues: FocusNavigationEventNameEnum (upval), UseResult (copy), InputHandlersModule (upval)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = { handler = UseResult },
			[FocusNavigationEventNameEnum.Confirm] = {
				handler = InputHandlersModule.onRelease(function() --[[ Line: 41 ]] end)
			}
		}
	end, {}), (ReactFocusNavigationModule.useEventMap(config))) else ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, UseResult)
end