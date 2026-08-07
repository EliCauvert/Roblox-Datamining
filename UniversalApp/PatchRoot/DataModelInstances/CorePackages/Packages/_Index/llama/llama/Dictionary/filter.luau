return function(p0, p1) --[[ line: 2 | named "filter" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local var1 = type(p1)
	assert(var1 == "function", "expected a function for second argument, got " .. var1)
	local t = {}
	
	for i, v in pairs(p0) do
		if p1(v, i) then
			t[i] = v
		end
	end
	return t
end