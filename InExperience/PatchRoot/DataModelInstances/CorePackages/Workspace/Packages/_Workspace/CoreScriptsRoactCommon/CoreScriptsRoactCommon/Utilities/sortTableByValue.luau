local function defaultCompareFn(p0, p1) --[[ line: 1 ]]
	return p0.value < p1.value
end

return function(p2, p3) --[[ line: 5 | named "sortTableByValue" ]]
	-- upvalues: defaultCompareFn (ref)
	local t = {}
	local var2 = p3 or defaultCompareFn
	
	for i, v in p2 do
		table.insert(t, { key = i, value = v })
	end
	table.sort(t, var2)
	
	return t
end