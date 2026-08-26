return function(p1)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	local p0Count = #p1
	local var2 = p0Count + 1
	
	for i = 1, p0Count do
		t[i] = p1[var2 - i]
	end
	return t
end