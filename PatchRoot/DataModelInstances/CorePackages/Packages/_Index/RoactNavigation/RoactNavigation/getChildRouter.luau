-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

local invariantModule = require(script.Parent.utils.invariant)

return function(p0, p1) --[[ line: 4 ]]
	-- upvalues: invariantModule (ref)
	if p0.childRouters and p0.childRouters[p1] then
		return p0.childRouters[p1]
	end
	invariantModule(type(p0.getComponentForRouteName) == "function", "router.getComponentForRouteName must be a function if no child routers are specified")
	local componentForRouteName = p0.getComponentForRouteName(p1)
	
	return if type(componentForRouteName) == "table" then componentForRouteName.router else nil
end