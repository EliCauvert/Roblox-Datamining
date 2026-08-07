local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local t = {}

local function useOnNavigateBack(p0, p1) --[[ line: 21 ]]
	-- upvalues: reactModule (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref)
	return reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useCallback(inputHandlersModule.onRelease(function(p2) --[[ line: 23 ]]
		-- upvalues: p0 (ref)
		p2:cancel()
		p0()
	end), { p0 }), nil, p1)
end

t.useOnNavigateBack = useOnNavigateBack

function t.OnNavigateBackWrapper(p3) --[[ line: 40 ]]
	-- upvalues: useOnNavigateBack (ref), reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = useOnNavigateBack(p3.onNavigateBack),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, p3.children)
end

return t