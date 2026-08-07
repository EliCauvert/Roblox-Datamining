return function(p0) --[[ line: 2 | named "reverse" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local t = {}
	local p0Count = #p0
	local var3 = p0Count + 1
	
	for i = 1, p0Count do
		t[i] = p0[var3 - i]
	end
	return t
end