return function(p1, p2)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local P1 = p2 or 1
	local ValueType1 = type(P1)
	assert(ValueType1 == "number" and P1 % 1 == 0, "expected an integer for second argument, got " .. ValueType1)
	local t = {}
	
	for i = 1, #p1 - P1 do
		t[i] = p1[i]
	end
	return t
end