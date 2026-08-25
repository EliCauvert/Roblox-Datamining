return function(p0, p1, p2, ...)
	local var7
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local var1 = type(p1)
	assert(var1 == "number" and p1 % 1 == 0, "expected an integer for second argument, got " .. var1)
	local var2 = type(p2)
	assert(var2 == "number" and p2 % 1 == 0, "expected an integer for third argument, got " .. var2)
	assert(p1 <= p2, "start index must be less than or equal to end index")
	local t = {}
	local var4 = 1
	local p0Count = #p0
	local maxValue = math.max(p1, 1)
	maxValue = math.min(maxValue, p0Count)
	
	for i_1 = 1, p0Count do
		var7 = i_1
		
		if var7 ~= maxValue then
			t[var4] = p0[var7]
			var4 += 1
			continue
		end
		for i = 1, select("#", ...) do
			t[var4] = select(i, ...)
			var4 += 1
		end
		local _ = maxValue
	end
	return t
end