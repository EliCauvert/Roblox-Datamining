return function(List, Callback): boolean --[[ Line: 2 | Named "every" ]]
	local ValueType = type(List)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(Callback)
	assert(ValueType1 == "function", "expected a function for second argument, got " .. ValueType1)
	
	for i, value in pairs(List) do
		if not Callback(value, i) then
			return false
		end
	end
	return true
end