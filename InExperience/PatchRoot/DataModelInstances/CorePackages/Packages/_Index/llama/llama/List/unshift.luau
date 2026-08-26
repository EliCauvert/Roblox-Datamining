return function(p1, ...)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local var2 = select("#", ...)
	local t = {}
	
	for i = 1, var2 do
		t[i] = select(i, ...)
	end
	for i_1 = 1, #p1 do
		t[var2 + i_1] = p1[i_1]
	end
	return t
end