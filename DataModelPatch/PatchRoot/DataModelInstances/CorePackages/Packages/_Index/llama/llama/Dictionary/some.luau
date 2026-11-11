return function(List, Callback): boolean
	local ValueType = type(Callback)
	assert(ValueType == "function", "expected a function for second argument, got " .. ValueType)
	
	for i, value in pairs(List) do
		if Callback(value, i) then
			return true
		end
	end
	return false
end