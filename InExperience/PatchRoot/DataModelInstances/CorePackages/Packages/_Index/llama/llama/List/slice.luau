return function(p1, p2, p3)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local p0Count = #p1
	p2 = p2 or 1
	p3 = p3 or p0Count
	assert(p2 <= p3, "start index must be less than or equal to end index")
	local t = {}
	local var2 = 1
	
	for i = math.max(1, p2), math.min(p3, p0Count) do
		t[var2] = p1[i]
		var2 += 1
	end
	return t
end