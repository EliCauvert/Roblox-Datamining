return function(p1, p2, p3)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	
	for i = p3 or #p1, 1, -1 do
		if p1[i] ~= p2 then
			continue
		end
		return i
	end
	return nil
end