return function(value)
	local var0 = type(value)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	
	for i = 1, #value do
		t[value[i]] = true
	end
	return t
end