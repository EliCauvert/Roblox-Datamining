return function(p1, Callback) --[[ Line: 2 | Named "filter" ]]
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(Callback)
	assert(ValueType1 == "function", "expected a function for second argument, got " .. ValueType1)
	local t = {}
	local Count = 1
	
	for i = 1, #p1 do
		if Callback(p1[i], i) then
			t[Count] = p1[i]
			Count += 1
		end
	end
	return t
end