return function(p1, p2: number, p3) --[[ Line: 2 | Named "set" ]]
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local CountP0 = #p1
	assert(p2 <= CountP0, "index must be less than or equal to the list length")
	assert(p2 >= 1, "index must be greater than or equal to 1")
	local t = {}
	local Count = 1
	
	for i = 1, CountP0 do
		if i == p2 then
			t[Count] = p3
		else
			t[Count] = p1[i]
		end
		Count += 1
	end
	return t
end