return function(p1, p2, p3)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local var2 = type(p2)
	assert(var2 == "function", "expected a function for second argument, got " .. var1)
	local p0Count = #p1
	local var3 = p3
	
	if var3 == nil then
		var3 = p1[p0Count]
	end
	for i = if p3 == nil then p0Count - 1 else p0Count, 1, -1 do
		var3 = p2(var3, p1[i], i)
	end
	return var3
end