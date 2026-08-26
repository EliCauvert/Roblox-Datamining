return function(p1, p2)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	assert(p2 ~= nil, "expected second argument to be anything but nil, got nil")
	
	return p1[p2] ~= nil
end