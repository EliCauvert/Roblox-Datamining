return function(p0, p1) --[[ line: 2 | named "pop" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	p1 = p1 or 1
	local var1 = type(p1)
	assert(var1 == "number" and p1 % 1 == 0, "expected an integer for second argument, got " .. var1)
	local t = {}
	
	for i = 1, #p0 - p1 do
		t[i] = p0[i]
	end
	return t
end