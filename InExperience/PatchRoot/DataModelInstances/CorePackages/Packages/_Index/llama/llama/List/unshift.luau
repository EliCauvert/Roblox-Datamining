return function(p1, ...) --[[ Line: 2 | Named "unshift" ]]
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local Selected: number = select("#", ...)
	local t = {}
	
	for i = 1, Selected do
		t[i] = select(i, ...)
	end
	for i1 = 1, #p1 do
		t[Selected + i1] = p1[i1]
	end
	return t
end