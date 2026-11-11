return function(Text: string)
	local List = {}
	
	for i in string.gmatch(Text, "[^\n]+") do
		local Match: string? = string.match(i, "^%s*(.-)%s*$")
		
		if Match and Match ~= "" then
			table.insert(List, Match)
		end
	end
	return List
end