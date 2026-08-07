return function(p0) --[[ line: 2 | named "keys" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	local var2 = 1
	
	for i, v in pairs(p0) do
		t[var2] = i
		var2 += 1
	end
	return t
end