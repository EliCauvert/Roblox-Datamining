return function(p1, p2)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local var2 = type(p2)
	assert(var2 == "number" and p2 % 1 == 0, "expected second argument to be an integer, got " .. var1)
	
	return p1[p2]
end