return function(p0) --[[ line: 2 | named "flip" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	
	for i, v in pairs(p0) do
		t[v] = i
	end
	return t
end