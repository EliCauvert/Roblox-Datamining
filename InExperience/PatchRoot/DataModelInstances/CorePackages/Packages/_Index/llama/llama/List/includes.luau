return function(p0, p1)
	local var0 = type(p0)
	assert(var0 == "table", "expected a table for first argument, got " .. var0)
	
	for i = 1, #p0 do
		if p0[i] ~= p1 then
			continue
		end
		return true
	end
	return false
end