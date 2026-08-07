local parent = script.Parent
local _ = require(parent.Parent.Parent.Navigation)
local getPageNameFromRouteModule = require(parent.getPageNameFromRoute)

return function(p0) --[[ line: 11 ]]
	-- upvalues: getPageNameFromRouteModule (ref)
	return if p0 and p0.routes and p0.routes[1] then getPageNameFromRouteModule(p0.routes[1]) else nil
end