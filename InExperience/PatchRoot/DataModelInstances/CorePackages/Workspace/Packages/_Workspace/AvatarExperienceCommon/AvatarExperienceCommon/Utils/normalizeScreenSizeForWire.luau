return function(Text: string): string --[[ Line: 26 | Named "normalizeScreenSizeForWire" ]]
	return if #Text == 0 then Text else string.lower((string.sub(Text, 1, 1))) .. string.sub(Text, 2)
end