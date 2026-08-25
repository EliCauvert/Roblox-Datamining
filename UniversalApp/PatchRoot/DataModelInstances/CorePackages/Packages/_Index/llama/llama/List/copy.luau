return function(p0)
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	
	for i = 1, #p0 do
		t[i] = p0[i]
	end
	return t
end