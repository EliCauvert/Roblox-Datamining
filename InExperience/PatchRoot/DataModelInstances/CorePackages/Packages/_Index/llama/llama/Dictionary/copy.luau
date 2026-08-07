return function(p0) --[[ line: 2 | named "copy" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	
	for i, v in pairs(p0) do
		t[i] = v
	end
	return t
end