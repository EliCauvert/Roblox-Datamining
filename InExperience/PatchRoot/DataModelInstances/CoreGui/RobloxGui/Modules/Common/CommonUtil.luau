return {
	TableConcat = function(p0, p1) --[[ line: 12 ]]
		for i = 1, #p1 do
			p0[#p0 + 1] = p1[i]
		end
		return p0
	end,
	SortByName = function(p2) --[[ line: 21 ]]
		table.sort(p2, function(p3, p4) --[[ line: 22 | named "compareInstanceNames" ]]
			return p3.Name < p4.Name
		end)
		
		return p2
	end
}