return function(p1, p2) --[[ Line: 1 ]]
	local List = {}
	
	if not p1 then
		return List
	end
	local v1 = p1[p2]
	
	if v1 then
		for i, _ in v1 do
			table.insert(List, i)
		end
	end
	return List
end