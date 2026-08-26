local copyModule = require(script.Parent.copy)

return function(p1, ...)
	-- upvalues: copyModule (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = copyModule(p1)
	
	for i = 1, select("#", ...) do
		var2[select(i, ...)] = nil
	end
	return var2
end