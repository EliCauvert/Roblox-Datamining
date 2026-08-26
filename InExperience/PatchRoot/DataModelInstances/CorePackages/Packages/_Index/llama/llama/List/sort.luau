local copyModule = require(script.Parent.copy)

return function(p1, p2)
	-- upvalues: copyModule (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = copyModule(p1)
	table.sort(var2, p2)
	
	return var2
end