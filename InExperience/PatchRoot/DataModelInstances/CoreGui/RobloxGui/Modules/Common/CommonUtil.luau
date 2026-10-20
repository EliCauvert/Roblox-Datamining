return {
	TableConcat = function(p1, p2)
		for i = 1, #p2 do
			p1[#p1 + 1] = p2[i]
		end
		return p1
	end,
	SortByName = function(List)
		table.sort(List, function(A, B): boolean
			return A.Name < B.Name
		end)
		
		return List
	end
}