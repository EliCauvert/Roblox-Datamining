return function(p1)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	
	for i, v in pairs(p1) do
		t[v] = i
	end
	return t
end