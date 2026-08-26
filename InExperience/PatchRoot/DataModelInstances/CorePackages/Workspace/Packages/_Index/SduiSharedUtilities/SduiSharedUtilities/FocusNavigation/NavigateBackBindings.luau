local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local t = {}

local function useOnNavigateBack(p1, p2)
	-- upvalues: reactModule (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref)
	return reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useCallback(inputHandlersModule.onRelease(function(p3)
		-- upvalues: p1 (ref)
		p3:cancel()
		p1()
	end), { p1 }), nil, p2)
end

t.useOnNavigateBack = useOnNavigateBack

function t.OnNavigateBackWrapper(p1)
	-- upvalues: useOnNavigateBack (ref), reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = useOnNavigateBack(p1.onNavigateBack),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, p1.children)
end

return t