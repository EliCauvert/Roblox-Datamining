return function(p1, ...)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	local CountP0 = #p1
	
	for i = 1, CountP0 do
		t[i] = p1[i]
	end
	for i1 = 1, select("#", ...) do
		t[CountP0 + i1] = select(i1, ...)
	end
	return t
end