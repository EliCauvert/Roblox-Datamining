local GetCurrentRouteKeyModule = require(script.Parent.getCurrentRouteKey)
local UseNavigationModule = require(script.Parent.useNavigation)

return function() --[[ Line: 4 | Named "useCurrentRouteKey" ]]
	-- upvalues: UseNavigationModule (copy), GetCurrentRouteKeyModule (copy)
	return GetCurrentRouteKeyModule((UseNavigationModule()))
end