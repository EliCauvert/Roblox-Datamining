local _ = require(script.Parent.types)
local DEV = _G.__DEV__

return function(p1)
	-- upvalues: DEV (copy)
	local Key, Value = next(p1)
	
	if DEV then
		assert(Key and Value, "route entry should contain exactly one route config")
	end
	return Key, Value
end