local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local config = {
	[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.SeeAll,
	[Enum.KeyCode.ButtonA] = FocusNavigationEventNameEnum.HoldToPlay
}

local function useControllerBarFocusNavigationBindings(OnSeeAll, Handler) --[[ Line: 23 ]]
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), config (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function() --[[ Line: 24 ]]
		-- upvalues: FocusNavigationEventNameEnum (upval), OnSeeAll (copy), InputHandlersModule (upval), Handler (copy)
		return {
			[FocusNavigationEventNameEnum.SeeAll] = if OnSeeAll then { handler = InputHandlersModule.onRelease(OnSeeAll) } else nil,
			[FocusNavigationEventNameEnum.HoldToPlay] = if Handler then { handler = Handler } else nil
		}
	end, { OnSeeAll, Handler }), (ReactFocusNavigationModule.useEventMap(config)))
end

return {
	useControllerBarFocusNavigationBindings = useControllerBarFocusNavigationBindings,
	OnSeeAllControllerBarNavigateWrapper = function(p1) --[[ Line: 45 ]]
		-- upvalues: useControllerBarFocusNavigationBindings (copy), ReactModule (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ref = useControllerBarFocusNavigationBindings(p1.onSeeAll),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, p1.children)
	end
}