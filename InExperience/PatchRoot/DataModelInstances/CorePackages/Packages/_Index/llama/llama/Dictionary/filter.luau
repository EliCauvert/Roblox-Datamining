return function(p1, p2)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local var2 = type(p2)
	assert(var2 == "function", "expected a function for second argument, got " .. var1)
	local t = {}
	
	for i, v in pairs(p1) do
		if p2(v, i) then
			t[i] = v
		end
	end
	return t
end