local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local t = {
	[Enum.KeyCode.ButtonX] = focusNavigationEventNameEnum.SeeAll,
	[Enum.KeyCode.ButtonA] = focusNavigationEventNameEnum.HoldToPlay
}
local t_1 = {}

local function useControllerBarFocusNavigationBindings(p0, p1) --[[ line: 23 ]]
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), t (ref)
	return reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function() --[[ line: 24 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), p0 (ref), inputHandlersModule (copy), p1 (ref)
		return {
			[focusNavigationEventNameEnum.SeeAll] = if p0 then { handler = inputHandlersModule.onRelease(p0) } else nil,
			[focusNavigationEventNameEnum.HoldToPlay] = if p1 then { handler = p1 } else nil
		}
	end, { p0, p1 }), reactFocusNavigationModule.useEventMap(t))
end

t_1.useControllerBarFocusNavigationBindings = useControllerBarFocusNavigationBindings

function t_1.OnSeeAllControllerBarNavigateWrapper(p2) --[[ line: 45 ]]
	-- upvalues: useControllerBarFocusNavigationBindings (ref), reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = useControllerBarFocusNavigationBindings(p2.onSeeAll),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, p2.children)
end

return t_1