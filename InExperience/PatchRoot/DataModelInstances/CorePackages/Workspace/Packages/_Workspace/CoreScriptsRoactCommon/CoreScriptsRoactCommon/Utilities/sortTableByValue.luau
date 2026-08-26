local function defaultCompareFn(p1, p2)
	return p1.value < p2.value
end

return function(p1, p2)
	-- upvalues: defaultCompareFn (ref)
	local t = {}
	local var1 = p2 or defaultCompareFn
	
	for i, v in p1 do
		table.insert(t, { key = i, value = v })
	end
	table.sort(t, var1)
	
	return t
end