return {
	TableConcat = function(p1, p2)
		for i = 1, #p2 do
			p1[#p1 + 1] = p2[i]
		end
		return p1
	end,
	SortByName = function(p3)
		table.sort(p3, function(p4, p5)
			return p4.Name < p5.Name
		end)
		
		return p3
	end
}