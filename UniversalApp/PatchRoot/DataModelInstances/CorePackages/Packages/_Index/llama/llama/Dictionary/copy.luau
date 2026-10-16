return function(List) --[[ Line: 2 | Named "copy" ]]
	local ValueType = type(List)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = value
	end
	return t
end