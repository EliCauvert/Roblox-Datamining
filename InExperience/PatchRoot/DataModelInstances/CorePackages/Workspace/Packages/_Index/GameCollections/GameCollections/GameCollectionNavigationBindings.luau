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

local function useControllerBarFocusNavigationBindings(p1, p2)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), t (ref)
	return reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), p1 (ref), inputHandlersModule (copy), p2 (ref)
		return {
			[focusNavigationEventNameEnum.SeeAll] = if p1 then { handler = inputHandlersModule.onRelease(p1) } else nil,
			[focusNavigationEventNameEnum.HoldToPlay] = if p2 then { handler = p2 } else nil
		}
	end, { p1, p2 }), reactFocusNavigationModule.useEventMap(t))
end

t_1.useControllerBarFocusNavigationBindings = useControllerBarFocusNavigationBindings

function t_1.OnSeeAllControllerBarNavigateWrapper(p1)
	-- upvalues: useControllerBarFocusNavigationBindings (ref), reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = useControllerBarFocusNavigationBindings(p1.onSeeAll),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, p1.children)
end

return t_1