return function(List)
	local ValueType = type(List)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	local Count = 1
	
	for i, _ in pairs(List) do
		t[Count] = i
		Count += 1
	end
	return t
end