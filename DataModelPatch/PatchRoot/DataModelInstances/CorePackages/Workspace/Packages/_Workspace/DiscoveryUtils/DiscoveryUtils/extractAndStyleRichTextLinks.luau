return function(Text: string)
	if Text == nil then
		return {}, ""
	else
		local List = {}
		
		return List, (string.gsub(Text, "<a%s+href=\"([^\"]+)\">([^<]*)</a>", function(Match, p1): string
			-- upvalues: List (copy)
			table.insert(List, Match)
			
			return `<u><b>{p1}</b></u>`
		end))
	end
end