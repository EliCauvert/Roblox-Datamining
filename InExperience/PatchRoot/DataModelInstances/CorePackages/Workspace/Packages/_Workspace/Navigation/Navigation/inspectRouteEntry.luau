local _ = require(script.Parent.types)
local dEV = _G.__DEV__

return function(p1)
	-- upvalues: dEV (ref)
	local var1, var2 = next(p1)
	
	if dEV then
		assert(var1 and var2, "route entry should contain exactly one route config")
	end
	return var1, var2
end