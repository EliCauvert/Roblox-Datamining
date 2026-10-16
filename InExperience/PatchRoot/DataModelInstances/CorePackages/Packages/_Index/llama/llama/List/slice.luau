return function(p1, p2, p3) --[[ Line: 2 | Named "slice" ]]
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local CountP0 = #p1
	local P1 = p2 or 1
	local P2 = p3 or CountP0
	assert(P1 <= P2, "start index must be less than or equal to end index")
	local t = {}
	local Count = 1
	
	for i = math.max(1, P1), math.min(P2, CountP0) do
		t[Count] = p1[i]
		Count += 1
	end
	return t
end