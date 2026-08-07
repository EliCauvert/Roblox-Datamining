return function(p0, p1) --[[ line: 2 | named "has" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	assert(p1 ~= nil, "expected second argument to be anything but nil, got nil")
	
	return p0[p1] ~= nil
end