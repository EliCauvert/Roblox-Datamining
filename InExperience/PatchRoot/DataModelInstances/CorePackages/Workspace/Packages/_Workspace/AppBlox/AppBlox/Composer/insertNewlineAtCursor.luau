return function(Text: string, p1: number) --[[ Line: 1 | Named "insertNewlineAtCursor" ]]
	if p1 < 1 then
		local Length = utf8.len(Text)
		local Text1 = Text .. "\n"
		
		if Length then
			return Text1, Length + 1
		else
			return Text1, 1
		end
	else
		local OffsetResult = utf8.offset(Text, p1)
		
		if OffsetResult ~= nil then
			return string.sub(Text, 1, OffsetResult - 1) .. "\n" .. string.sub(Text, OffsetResult), p1 + 1
		end
		local Length = utf8.len(Text)
		local Text2 = Text .. "\n"
		
		if Length then
			return Text2, Length + 1
		else
			return Text2, 1
		end
	end
end