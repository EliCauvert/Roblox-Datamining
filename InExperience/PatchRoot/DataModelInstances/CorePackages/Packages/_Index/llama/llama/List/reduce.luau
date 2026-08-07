return function(p0, p1, p2) --[[ line: 2 | named "reduce" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local var1 = type(p1)
	assert(var1 == "function", "expected a function for second argument, got " .. var1)
	local var2 = p2
	
	if var2 == nil then
		var2 = p0[1]
	end
	for i = if p2 == nil then 2 else 1, #p0 do
		var2 = p1(var2, p0[i], i)
	end
	return var2
end