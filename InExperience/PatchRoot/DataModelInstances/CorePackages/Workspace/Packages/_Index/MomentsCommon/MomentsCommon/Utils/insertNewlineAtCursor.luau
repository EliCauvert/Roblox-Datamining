return function(Text: string, p1: number) --[[ Line: 9 | Named "insertNewlineAtCursor" ]]
	local Length: number = utf8.len(Text) or #Text
	local NewLength = if p1 >= 1 and p1 <= Length + 1 then p1 else Length + 1
	local OffsetResult: number = (if NewLength > 1 then utf8.offset(Text, NewLength) else 1) or #Text + 1
	
	return string.sub(Text, 1, OffsetResult - 1) .. "\n" .. string.sub(Text, OffsetResult), NewLength + 1
end