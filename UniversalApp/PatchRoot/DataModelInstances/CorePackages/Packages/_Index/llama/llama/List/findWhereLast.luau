return function(p1, p2, p3)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	local var2 = type(p2)
	assert(var2 == "function", "expected a function for second argument, got " .. var1)
	
	for i = p3 or #p1, 1, -1 do
		if not p2(p1[i], i) then
			continue
		end
		return i
	end
	return nil
end