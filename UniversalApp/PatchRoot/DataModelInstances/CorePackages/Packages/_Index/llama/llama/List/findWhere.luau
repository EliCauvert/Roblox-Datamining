return function(p1, Callback, p2): number?
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(Callback)
	assert(ValueType1 == "function", "expected a function for second argument, got " .. ValueType1)
	
	for i = p2 or 1, #p1 do
		if Callback(p1[i], i) then
			return i
		end
	end
	return nil
end