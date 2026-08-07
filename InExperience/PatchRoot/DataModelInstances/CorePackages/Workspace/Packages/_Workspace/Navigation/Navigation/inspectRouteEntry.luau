local _ = require(script.Parent.types)
local dEV = _G.__DEV__

return function(p0) --[[ line: 5 | named "inspectRouteEntry" ]]
	-- upvalues: dEV (ref)
	local var0, var1 = next(p0)
	
	if dEV then
		assert(var0 and var1, "route entry should contain exactly one route config")
	end
	return var0, var1
end