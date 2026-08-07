return function(value, p0, p1) --[[ line: 2 | named "set" ]]
	local var0 = type(value)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local valueCount = #value
	assert(p0 <= valueCount, "index must be less than or equal to the list length")
	assert(p0 >= 1, "index must be greater than or equal to 1")
	local t = {}
	local var3 = 1
	
	for i = 1, valueCount do
		if i == p0 then
			t[var3] = p1
		else
			t[var3] = value[i]
		end
		var3 += 1
	end
	return t
end