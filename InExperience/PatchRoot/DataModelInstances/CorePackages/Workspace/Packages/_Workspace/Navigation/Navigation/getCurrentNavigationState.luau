local _ = require(script.Parent.types)

local function getCurrentNavigationState(p0)
	-- upvalues: getCurrentNavigationState (ref)
	return if p0.routes and p0.index then getCurrentNavigationState(p0.routes[p0.index]) else p0
end

return getCurrentNavigationState