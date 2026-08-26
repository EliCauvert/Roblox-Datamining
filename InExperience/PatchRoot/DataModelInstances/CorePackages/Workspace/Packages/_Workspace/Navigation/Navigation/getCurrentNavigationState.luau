local _ = require(script.Parent.types)

local function getCurrentNavigationState(p1)
	-- upvalues: getCurrentNavigationState (ref)
	return if p1.routes and p1.index then getCurrentNavigationState(p1.routes[p1.index]) else p1
end

return getCurrentNavigationState