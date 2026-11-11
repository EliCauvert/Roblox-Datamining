local InvariantModule = require(script.Parent.utils.invariant)

return function(p1, p2)
	-- upvalues: InvariantModule (copy)
	if p1.childRouters and p1.childRouters[p2] then
		return p1.childRouters[p2]
	else
		InvariantModule(type(p1.getComponentForRouteName) == "function", "router.getComponentForRouteName must be a function if no child routers are specified")
		local ComponentForRouteName = p1.getComponentForRouteName(p2)
		
		return if type(ComponentForRouteName) == "table" then ComponentForRouteName.router else nil
	end
end