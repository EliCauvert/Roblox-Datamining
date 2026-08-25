return function(p0, p1)
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local var1 = type(p1)
	assert(var1 == "function", "expected a function for second argument, got " .. var1)
	local t = {}
	
	for i, v in pairs(p0) do
		local var3, var4 = p1(v, i)
		t[var4 or i] = var3
	end
	return t
end