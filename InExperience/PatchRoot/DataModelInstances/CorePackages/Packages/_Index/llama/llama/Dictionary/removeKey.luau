local copyModule = require(script.Parent.copy)

return function(p0, ...) --[[ line: 4 | named "removeKey" ]]
	-- upvalues: copyModule (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = copyModule(p0)
	
	for i = 1, select("#", ...) do
		var2[select(i, ...)] = nil
	end
	return var2
end