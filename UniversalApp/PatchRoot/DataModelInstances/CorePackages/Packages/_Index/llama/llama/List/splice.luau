return function(p1, p2, p3, ...)
	local var1
	local var2 = type(p1)
	assert(var2 == "table", "expected a table for first argument, got " .. var0)
	local var3 = type(p2)
	assert(var3 == "number" and p2 % 1 == 0, "expected an integer for second argument, got " .. var1)
	local var4 = type(p3)
	assert(var4 == "number" and p3 % 1 == 0, "expected an integer for third argument, got " .. var2)
	assert(p2 <= p3, "start index must be less than or equal to end index")
	local t = {}
	local var5 = 1
	local p0Count = #p1
	local maxValue = math.max(p2, 1)
	maxValue = math.min(maxValue, p0Count)
	
	for i_1 = 1, p0Count do
		var1 = i_1
		
		if var1 ~= maxValue then
			t[var5] = p1[var1]
			var5 += 1
			continue
		end
		for i = 1, select("#", ...) do
			t[var5] = select(i, ...)
			var5 += 1
		end
		local _ = maxValue
	end
	return t
end