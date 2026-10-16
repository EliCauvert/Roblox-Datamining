return function(p1) --[[ Line: 2 | Named "toSet" ]]
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	
	for i = 1, #p1 do
		t[p1[i]] = true
	end
	return t
end