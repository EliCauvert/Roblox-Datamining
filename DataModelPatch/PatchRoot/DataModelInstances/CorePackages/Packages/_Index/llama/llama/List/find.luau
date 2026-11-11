return function(p1, p2, p3): number?
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	
	for i = p3 or 1, #p1 do
		if p1[i] == p2 then
			return i
		end
	end
	return nil
end