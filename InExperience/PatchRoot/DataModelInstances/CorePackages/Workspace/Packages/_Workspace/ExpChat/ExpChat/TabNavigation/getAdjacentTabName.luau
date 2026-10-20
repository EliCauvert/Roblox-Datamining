return function(Tbl, Name, p1)
	if #Tbl < 2 then
		return nil
	end
	local Copy = table.clone(Tbl)
	table.sort(Copy, function(A, B): boolean
		return A.tabIndex < B.tabIndex
	end)
	local v1: number? = nil
	
	for i, value in Copy do
		if value.name == Name then
			v1 = i
			break
		end
	end
	return if v1 == nil then nil else Copy[(v1 - 1 + p1) % #Copy + 1].name
end