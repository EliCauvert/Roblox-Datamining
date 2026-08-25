local parent = script.Parent
local _ = require(parent.Parent.Parent.Navigation)
local getPageNameFromRouteModule = require(parent.getPageNameFromRoute)

return function(p0)
	-- upvalues: getPageNameFromRouteModule (ref)
	return if p0 and p0.routes and p0.index then getPageNameFromRouteModule(p0.routes[p0.index]) else nil
end