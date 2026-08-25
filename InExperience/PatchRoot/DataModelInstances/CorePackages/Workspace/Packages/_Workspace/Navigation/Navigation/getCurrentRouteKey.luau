local _ = require(script.Parent.types)
local getCurrentRouteStateModule = require(script.Parent.getCurrentRouteState)

return function(p0)
	-- upvalues: getCurrentRouteStateModule (ref)
	local var1 = getCurrentRouteStateModule(p0)
	
	return if var1 then var1.key else nil
end