return function(Text)
	if Text == nil then
		error("cannot extract keys from a nil value")
	end
	local ValueType = typeof(Text)
	local List = {}
	
	if ValueType == "table" then
		for i in pairs(Text) do
			table.insert(List, i)
		end
		return List
	else
		if ValueType == "string" then
			for i1 = 1, Text:len() do
				List[i1] = tostring(i1)
			end
		end
		return List
	end
end