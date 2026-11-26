return function(Text: string, p1: number): string
	local OffsetResult = utf8.offset(Text, p1 + 1)
	
	return if OffsetResult == nil or OffsetResult > #Text then Text else string.sub(Text, 1, OffsetResult - 1) .. "…"
end