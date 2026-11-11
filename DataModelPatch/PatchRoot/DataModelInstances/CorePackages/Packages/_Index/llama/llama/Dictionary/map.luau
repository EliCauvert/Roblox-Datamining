return function(List, Callback)
	local ValueType = type(List)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(Callback)
	assert(ValueType1 == "function", "expected a function for second argument, got " .. ValueType1)
	local t = {}
	
	for i, value in pairs(List) do
		local CallbackResult2
		t[CallbackResult2 or i], CallbackResult2 = Callback(value, i)
	end
	return t
end