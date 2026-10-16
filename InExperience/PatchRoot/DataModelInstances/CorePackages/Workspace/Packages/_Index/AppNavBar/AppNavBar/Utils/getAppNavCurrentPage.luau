local Parent = script.Parent
local _ = require(Parent.Parent.Parent.Navigation)
local GetPageNameFromRouteModule = require(Parent.getPageNameFromRoute)

return function(p1) --[[ Line: 11 ]]
	-- upvalues: GetPageNameFromRouteModule (copy)
	return if p1 and p1.routes and p1.index then GetPageNameFromRouteModule(p1.routes[p1.index]) else nil
end