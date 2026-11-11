local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum

local function useOnNavigateBack(Callback, p1)
	-- upvalues: ReactModule (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy)
	return ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, ReactModule.useCallback(InputHandlersModule.onRelease(function(p2)
		-- upvalues: Callback (copy)
		p2:cancel()
		Callback()
	end), { Callback }), nil, p1)
end

return {
	useOnNavigateBack = useOnNavigateBack,
	OnNavigateBackWrapper = function(p1)
		-- upvalues: useOnNavigateBack (copy), ReactModule (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ref = useOnNavigateBack(p1.onNavigateBack),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, p1.children)
	end
}