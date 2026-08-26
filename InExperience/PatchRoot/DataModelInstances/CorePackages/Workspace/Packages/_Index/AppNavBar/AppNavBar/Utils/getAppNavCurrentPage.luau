local parent = script.Parent
local _ = require(parent.Parent.Parent.Navigation)
local getPageNameFromRouteModule = require(parent.getPageNameFromRoute)

return function(p1)
	-- upvalues: getPageNameFromRouteModule (ref)
	return if p1 and p1.routes and p1.index then getPageNameFromRouteModule(p1.routes[p1.index]) else nil
end