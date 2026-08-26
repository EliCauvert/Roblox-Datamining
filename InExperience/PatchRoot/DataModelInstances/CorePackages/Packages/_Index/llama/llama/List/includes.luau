return function(p1, p2)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var0)
	
	for i = 1, #p1 do
		if p1[i] ~= p2 then
			continue
		end
		return true
	end
	return false
end