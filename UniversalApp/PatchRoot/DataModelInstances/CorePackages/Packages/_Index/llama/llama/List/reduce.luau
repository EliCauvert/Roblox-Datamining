return function(Entry, Callback, p1) --[[ Line: 2 | Named "reduce" ]]
	local ValueType = type(Entry)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(Callback)
	assert(ValueType1 == "function", "expected a function for second argument, got " .. ValueType1)
	local v1 = p1
	
	if v1 == nil then
		v1 = Entry[1]
	end
	local v2: number = if p1 == nil then 2 else 1
	for i = v2, #Entry do
		v1 = Callback(v1, Entry[i], i)
	end
	return v1
end