local invariantModule = require(script.Parent.utils.invariant)

return function(p1, p2)
	-- upvalues: invariantModule (ref)
	if p1.childRouters and p1.childRouters[p2] then
		return p1.childRouters[p2]
	end
	invariantModule(type(p1.getComponentForRouteName) == "function", "router.getComponentForRouteName must be a function if no child routers are specified")
	local componentForRouteName = p1.getComponentForRouteName(p2)
	
	return if type(componentForRouteName) == "table" then componentForRouteName.router else nil
end