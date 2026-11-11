return function(p1, p2): boolean
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	
	for i = 1, #p1 do
		if p1[i] == p2 then
			return true
		end
	end
	return false
end