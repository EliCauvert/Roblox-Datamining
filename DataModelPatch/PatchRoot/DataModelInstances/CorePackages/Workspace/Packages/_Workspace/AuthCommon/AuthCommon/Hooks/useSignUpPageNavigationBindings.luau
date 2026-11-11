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

return function(Callback)
	-- upvalues: ReactModule (copy), FFlagEnableConfirmSignifierOnSignUpPage (copy), ReactFocusNavigationModule (copy), config (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: Callback (copy)
		p1:cancel()
		
		if p1.eventData and p1.eventData.KeyCode == Enum.KeyCode.Unknown then return end
		if Callback then
			Callback()
		end
	end, if Callback then { Callback } else {})
	
	return if FFlagEnableConfirmSignifierOnSignUpPage then ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), UseResult (copy), InputHandlersModule (upval)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = { handler = UseResult },
			[FocusNavigationEventNameEnum.Confirm] = {
				handler = InputHandlersModule.onRelease(function() end)
			}
		}
	end, {}), (ReactFocusNavigationModule.useEventMap(config))) else ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, UseResult)
end