return function(p1, ...)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	local p0Count = #p1
	
	for i = 1, p0Count do
		t[i] = p1[i]
	end
	for i_1 = 1, select("#", ...) do
		t[p0Count + i_1] = select(i_1, ...)
	end
	return t
end