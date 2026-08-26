return function(p1, p2, ...)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local p0Count = #p1
	assert(p2 >= 1 and p2 <= p0Count + 1, "index must be in bounds of list")
	local t = {}
	local var2 = 1
	
	for i_1 = 1, p0Count do
		if i_1 ~= p2 then
			t[var2] = p1[i_1]
			var2 += 1
			continue
		end
		for i = 1, select("#", ...) do
			t[var2] = select(i, ...)
			var2 += 1
		end
	end
	return t
end