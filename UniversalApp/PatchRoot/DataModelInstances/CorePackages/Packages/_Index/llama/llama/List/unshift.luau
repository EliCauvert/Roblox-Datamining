return function(p0, ...)
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local var1 = select("#", ...)
	local t = {}
	
	for i = 1, var1 do
		t[i] = select(i, ...)
	end
	for i_1 = 1, #p0 do
		t[var1 + i_1] = p0[i_1]
	end
	return t
end