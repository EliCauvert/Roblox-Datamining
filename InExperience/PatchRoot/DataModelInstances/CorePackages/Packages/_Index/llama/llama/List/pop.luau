return function(p1, p2)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	p2 = p2 or 1
	local var2 = type(p2)
	assert(var2 == "number" and p2 % 1 == 0, "expected an integer for second argument, got " .. var1)
	local t = {}
	
	for i = 1, #p1 - p2 do
		t[i] = p1[i]
	end
	return t
end