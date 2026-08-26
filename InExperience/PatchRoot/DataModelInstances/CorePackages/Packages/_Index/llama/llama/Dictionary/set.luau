local copyModule = require(script.Parent.copy)

return function(value, p1, p2)
	-- upvalues: copyModule (ref)
	local var1 = type(value)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	assert(p1 ~= nil, "expected second argument to be anything but nil, got nil")
	local var2 = copyModule(value)
	var2[p1] = p2
	
	return var2
end