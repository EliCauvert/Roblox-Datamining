return function(p1, p2: number) --[[ Line: 2 | Named "get" ]]
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(p2)
	assert(ValueType1 == "number" and p2 % 1 == 0, "expected second argument to be an integer, got " .. ValueType1)
	
	return p1[p2]
end