local parent = script:FindFirstAncestor("AppBlox").Parent
local inputHandlersModule = require(parent.InputHandlers)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local reactModule = require(parent.React)
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1, p2)
	-- upvalues: reactModule (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), t (ref), focusNavigationEventNameEnum (ref)
	return reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useMemo(function()
		-- upvalues: inputHandlersModule (copy), p2 (ref)
		return inputHandlersModule.onRelease(function(p3)
			-- upvalues: p2 (copy)
			if p2 then
				p2()
				p3:cancel()
			end
		end)
	end, { p2 }), nil, reactFocusNavigationModule.useEventMap(t, p1))
end