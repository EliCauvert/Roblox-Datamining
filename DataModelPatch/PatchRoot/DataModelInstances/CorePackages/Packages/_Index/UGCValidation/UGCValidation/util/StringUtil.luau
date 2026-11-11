return {
	keysToString = function(List, Separator: string, p1): string
		local List1 = {}
		
		for i in List do
			table.insert(List1, (tostring(i)))
		end
		if p1 then
			table.sort(List1)
		end
		return table.concat(List1, Separator)
	end
}