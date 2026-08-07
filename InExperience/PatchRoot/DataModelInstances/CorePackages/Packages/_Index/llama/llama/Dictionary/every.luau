return function(p0, p1) --[[ line: 2 | named "every" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	local var1 = type(p1)
	assert(var1 == "function", "expected a function for second argument, got " .. var1)
	
	for i, v in pairs(p0) do
		if not p1(v, i) then
			return false
		end
	end
	return true
end