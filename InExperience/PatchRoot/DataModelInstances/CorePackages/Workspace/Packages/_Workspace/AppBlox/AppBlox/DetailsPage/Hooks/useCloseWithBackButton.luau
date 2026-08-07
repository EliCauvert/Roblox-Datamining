local parent = script:FindFirstAncestor("AppBlox").Parent
local inputHandlersModule = require(parent.InputHandlers)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local reactModule = require(parent.React)
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p0, p1) --[[ line: 15 | named "useCloseWithBackButton" ]]
	-- upvalues: reactModule (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), t (ref), focusNavigationEventNameEnum (ref)
	return reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useMemo(function() --[[ line: 16 ]]
		-- upvalues: inputHandlersModule (copy), p1 (ref)
		return inputHandlersModule.onRelease(function(p2) --[[ line: 17 ]]
			-- upvalues: p1 (copy)
			if p1 then
				p1()
				p2:cancel()
			end
		end)
	end, { p1 }), nil, reactFocusNavigationModule.useEventMap(t, p0))
end