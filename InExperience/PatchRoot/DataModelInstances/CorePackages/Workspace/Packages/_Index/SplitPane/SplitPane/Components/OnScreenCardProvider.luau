local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local onScreenContext = require(parent.RobloxAppNavigation).OnScreenContext

return function(p1)
	-- upvalues: reactModule (ref), onScreenContext (ref)
	local value = p1.value
	local var1 = reactModule.useRef(nil)
	local current = var1.current
	
	if current == nil or current.isOnScreen ~= value.isOnScreen or current.currentRouteKey ~= value.currentRouteKey then
		var1.current = value
	else
		value = current
	end
	return reactModule.createElement(onScreenContext.Provider, { value = value }, p1.children)
end