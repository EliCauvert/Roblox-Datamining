local GetCurrentRouteKeyModule = require(script.Parent.getCurrentRouteKey)
local UseNavigationModule = require(script.Parent.useNavigation)

return function()
	-- upvalues: UseNavigationModule (copy), GetCurrentRouteKeyModule (copy)
	return GetCurrentRouteKeyModule((UseNavigationModule()))
end