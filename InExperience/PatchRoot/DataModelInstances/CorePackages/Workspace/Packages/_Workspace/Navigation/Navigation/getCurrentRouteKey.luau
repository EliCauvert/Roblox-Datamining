local _ = require(script.Parent.types)
local getCurrentRouteStateModule = require(script.Parent.getCurrentRouteState)

return function(p1)
	-- upvalues: getCurrentRouteStateModule (ref)
	local var1 = getCurrentRouteStateModule(p1)
	
	return if var1 then var1.key else nil
end