return function(p1) --[[ Line: 2 | Named "copy" ]]
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	
	for i = 1, #p1 do
		t[i] = p1[i]
	end
	return t
end