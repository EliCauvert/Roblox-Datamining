return function(p1)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	local CountP0 = #p1
	local NewCountP = CountP0 + 1
	
	for i = 1, CountP0 do
		t[i] = p1[NewCountP - i]
	end
	return t
end