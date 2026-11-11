return function(p1, p2: number, ...)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local CountP0 = #p1
	assert(p2 >= 1 and p2 <= CountP0 + 1, "index must be in bounds of list")
	local t = {}
	local Count = 1
	
	for i = 1, CountP0 do
		if i == p2 then
			for i1 = 1, select("#", ...) do
				t[Count] = select(i1, ...)
				Count += 1
			end
		end
		t[Count] = p1[i]
		Count += 1
	end
	return t
end