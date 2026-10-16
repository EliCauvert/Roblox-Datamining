return function(Text: string, p1): string --[[ Line: 49 | Named "unindentTags" ]]
	local P0 = p1 or 2
	
	if not string.find(Text, "<.->") then
		return Text
	end
	local Parts = string.split(string.gsub(Text, "\r\n", "\n"), "\n")
	local Buffer = table.create(#Parts)
	local List = {}
	
	for _, part in Parts do
		local _, EndIndex = string.find(part, "^[ \t]*")
		local EndIndex1 = EndIndex or 0
		local Segment = string.sub(part, EndIndex1 + 1)
		
		if not string.find(Segment, "^<") then
			table.insert(Buffer, string.rep(" ", (math.max(0, EndIndex1 - (if #List > 0 then List[#List] + P0 else 0)))) .. Segment)
			continue
		end
		if string.find(Segment, "^</") then
			table.remove(List)
			table.insert(Buffer, Segment)
		elseif string.find(Segment, "/>$") then
			table.insert(Buffer, Segment)
		else
			table.insert(List, EndIndex1)
			table.insert(Buffer, Segment)
		end
	end
	return table.concat(Buffer, "\n")
end