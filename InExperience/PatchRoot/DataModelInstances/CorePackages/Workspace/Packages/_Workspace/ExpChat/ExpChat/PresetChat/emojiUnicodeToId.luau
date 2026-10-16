return function(p1): string --[[ Line: 2 | Named "emojiUnicodeToId" ]]
	local List = {}
	
	for _, value in utf8.codes(p1) do
		table.insert(List, string.format("%x", value))
	end
	return table.concat(List, "-")
end