return function(List, p1): boolean
	local ValueType = type(List)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	
	for _, value in pairs(List) do
		if value == p1 then
			return true
		end
	end
	return false
end