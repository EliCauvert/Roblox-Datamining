local function defaultCompareFn(p1, p2): boolean --[[ Line: 1 ]]
	return p1.value < p2.value
end

return function(List, p1) --[[ Line: 5 | Named "sortTableByValue" ]]
	-- upvalues: defaultCompareFn (copy)
	local List1 = {}
	local DefaultCompareFn = if p1 then p1 else defaultCompareFn
	for Key, Value in List do
		table.insert(List1, { key = Key, value = Value })
	end
	table.sort(List1, DefaultCompareFn)
	
	return List1
end