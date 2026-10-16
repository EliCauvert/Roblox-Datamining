local _ = require(script.Parent.types)

local function getCurrentNavigationState(Route) --[[ Line: 7 ]]
	-- upvalues: getCurrentNavigationState (copy)
	return if Route.routes and Route.index then getCurrentNavigationState(Route.routes[Route.index]) else Route
end

return getCurrentNavigationState