return function(p1, Callback, p2) --[[ Line: 2 | Named "reduceRight" ]]
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(Callback)
	assert(ValueType1 == "function", "expected a function for second argument, got " .. ValueType1)
	local CountP0 = #p1
	local v1 = p2
	
	if v1 == nil then
		v1 = p1[CountP0]
	end
	local CountPDelta: number = p2 == nil and CountP0 - 1 or CountP0
	for i = CountPDelta, 1, -1 do
		v1 = Callback(v1, p1[i], i)
	end
	return v1
end