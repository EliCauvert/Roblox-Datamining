local getCurrentRouteKeyModule = require(script.Parent.getCurrentRouteKey)
local useNavigationModule = require(script.Parent.useNavigation)

return function()
	-- upvalues: useNavigationModule (ref), getCurrentRouteKeyModule (ref)
	return getCurrentRouteKeyModule(useNavigationModule())
end