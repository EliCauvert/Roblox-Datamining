return function(List, p1): string
	local List1 = {}
	
	for _, value in List do
		local v1 = if p1 then p1[value] else nil
		
		if v1 == 0 then
			table.insert(List1, `{value} (must be empty)`)
		elseif v1 == nil then
			table.insert(List1, value)
		else
			table.insert(List1, `{value} (limit {v1} bytes)`)
		end
	end
	return table.concat(List1, ", ")
end