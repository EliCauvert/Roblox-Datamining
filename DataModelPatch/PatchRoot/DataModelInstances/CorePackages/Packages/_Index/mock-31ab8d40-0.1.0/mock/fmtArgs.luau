return function(p1): string
	local List = {}
	
	for i = 1, p1.n do
		if type(p1[i]) == "string" then
			table.insert(List, "\"" .. p1[i] .. "\"")
		else
			table.insert(List, (tostring(p1[i])))
		end
	end
	return "{" .. table.concat(List, ", ") .. "}"
end