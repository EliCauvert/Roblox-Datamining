return function(List, List1)
	local List2 = {}
	
	for _, Text in List1 do
		if string.sub(Text, 1, 6) == "names." then
			table.insert(List2, (string.sub(Text, 7)))
		end
	end
	if List == nil or #List2 == 0 then
		return List
	end
	local List3 = {}
	
	for _, value in List do
		local Copy = if type(value.names) == "table" then table.clone(value.names) else {}
		for _, value1 in List2 do
			if type(Copy[value1]) ~= "string" then
				Copy[value1] = ""
			end
		end
		local Copy1 = table.clone(value)
		Copy1.names = Copy
		table.insert(List3, Copy1)
	end
	return List3
end