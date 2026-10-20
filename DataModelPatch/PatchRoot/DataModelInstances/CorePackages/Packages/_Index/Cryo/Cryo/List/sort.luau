return function(p1, p2)
	local List = {}
	
	for i = 1, #p1 do
		List[i] = p1[i]
	end
	table.sort(List, p2)
	
	return List
end