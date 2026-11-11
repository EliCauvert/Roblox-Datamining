return function(List)
	local ValueType = type(List)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	
	for i, value in pairs(List) do
		t[value] = i
	end
	return t
end