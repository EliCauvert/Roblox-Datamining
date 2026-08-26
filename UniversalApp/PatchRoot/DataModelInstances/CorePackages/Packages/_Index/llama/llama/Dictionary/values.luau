return function(p1)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	local var2 = 1
	
	for i, v in pairs(p1) do
		t[var2] = v
		var2 += 1
	end
	return t
end