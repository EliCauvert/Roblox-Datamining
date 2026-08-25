return {
	TableConcat = function(p0, p1)
		for i = 1, #p1 do
			p0[#p0 + 1] = p1[i]
		end
		return p0
	end,
	SortByName = function(p2)
		table.sort(p2, function(p3, p4)
			return p3.Name < p4.Name
		end)
		
		return p2
	end
}