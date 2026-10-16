return {
	TableConcat = function(p1, p2) --[[ Line: 12 ]]
		for i = 1, #p2 do
			p1[#p1 + 1] = p2[i]
		end
		return p1
	end,
	SortByName = function(List) --[[ Line: 21 ]]
		table.sort(List, function(A, B): boolean --[[ Line: 22 | Named "compareInstanceNames" ]]
			return A.Name < B.Name
		end)
		
		return List
	end
}