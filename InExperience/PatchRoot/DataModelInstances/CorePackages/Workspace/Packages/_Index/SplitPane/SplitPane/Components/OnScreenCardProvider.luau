local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local OnScreenContext = require(Parent.RobloxAppNavigation).OnScreenContext

return function(p1)
	-- upvalues: ReactModule (copy), OnScreenContext (copy)
	local Value = p1.value
	local UseRefResult = ReactModule.useRef(nil)
	local Current = UseRefResult.current
	
	if Current == nil or Current.isOnScreen ~= Value.isOnScreen or Current.currentRouteKey ~= Value.currentRouteKey then
		UseRefResult.current = Value
	else
		Value = Current
	end
	return ReactModule.createElement(OnScreenContext.Provider, { value = Value }, p1.children)
end