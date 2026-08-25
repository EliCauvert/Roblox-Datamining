return function(p0, p1)
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local var1 = type(p1)
	assert(var1 == "number" and p1 % 1 == 0, "expected second argument to be an integer, got " .. var1)
	
	return p0[p1]
end