return function(p1): string
	local List = {}
	
	for _, value in utf8.codes(p1) do
		table.insert(List, string.format("%x", value))
	end
	return table.concat(List, "-")
end