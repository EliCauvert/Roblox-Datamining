return function(p1, p2) --[[ Line: 6 | Named "sort" ]]
	local List = {}
	
	for i = 1, #p1 do
		List[i] = p1[i]
	end
	table.sort(List, p2)
	
	return List
end