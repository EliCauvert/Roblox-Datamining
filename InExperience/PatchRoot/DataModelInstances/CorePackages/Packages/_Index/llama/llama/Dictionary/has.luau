return function(p1, p2): boolean --[[ Line: 2 | Named "has" ]]
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	assert(p2 ~= nil, "expected second argument to be anything but nil, got nil")
	
	return p1[p2] ~= nil
end