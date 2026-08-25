return function(p0)
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	local var2 = 1
	
	for i, v in pairs(p0) do
		t[var2] = v
		var2 += 1
	end
	return t
end