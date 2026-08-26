return function(value, p1, p2)
	local var1 = type(value)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local valueCount = #value
	assert(p1 <= valueCount, "index must be less than or equal to the list length")
	assert(p1 >= 1, "index must be greater than or equal to 1")
	local t = {}
	local var2 = 1
	
	for i = 1, valueCount do
		if i == p1 then
			t[var2] = p2
		else
			t[var2] = value[i]
		end
		var2 += 1
	end
	return t
end