return function(p0, p1, p2) --[[ line: 2 | named "reduceRight" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local var1 = type(p1)
	assert(var1 == "function", "expected a function for second argument, got " .. var1)
	local p0Count = #p0
	local var3 = p2
	
	if var3 == nil then
		var3 = p0[p0Count]
	end
	for i = if p2 == nil then p0Count - 1 else p0Count, 1, -1 do
		var3 = p1(var3, p0[i], i)
	end
	return var3
end