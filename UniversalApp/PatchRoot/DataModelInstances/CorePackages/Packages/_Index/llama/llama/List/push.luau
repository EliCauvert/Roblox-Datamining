return function(p0, ...)
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	local p0Count = #p0
	
	for i = 1, p0Count do
		t[i] = p0[i]
	end
	for i_1 = 1, select("#", ...) do
		t[p0Count + i_1] = select(i_1, ...)
	end
	return t
end