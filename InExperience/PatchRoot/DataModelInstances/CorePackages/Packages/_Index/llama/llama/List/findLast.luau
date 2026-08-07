return function(p0, p1, p2) --[[ line: 2 | named "find" ]]
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	
	for i = p2 or #p0, 1, -1 do
		if p0[i] ~= p1 then
			continue
		end
		return i
	end
	return nil
end