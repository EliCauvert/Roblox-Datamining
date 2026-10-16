return function(p1, Callback): boolean --[[ Line: 2 | Named "some" ]]
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(Callback)
	assert(ValueType1 == "function", "expected a function for second argument, got " .. ValueType1)
	
	for i = 1, #p1 do
		if Callback(p1[i], i) then
			return true
		end
	end
	return false
end