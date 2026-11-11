local Parent = script:FindFirstAncestor("AppBlox").Parent
local InputHandlersModule = require(Parent.InputHandlers)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local ReactModule = require(Parent.React)
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1, Callback)
	-- upvalues: ReactModule (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), config (copy), FocusNavigationEventNameEnum (copy)
	return (ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, ReactModule.useMemo(function()
		-- upvalues: InputHandlersModule (upval), Callback (copy)
		return InputHandlersModule.onRelease(function(p2)
			-- upvalues: Callback (upval)
			if Callback then
				Callback()
				p2:cancel()
			end
		end)
	end, { Callback }), nil, (ReactFocusNavigationModule.useEventMap(config, p1))))
end