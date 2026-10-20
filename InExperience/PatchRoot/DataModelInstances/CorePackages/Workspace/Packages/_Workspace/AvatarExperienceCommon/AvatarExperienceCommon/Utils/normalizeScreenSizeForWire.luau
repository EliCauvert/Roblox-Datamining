return function(Text: string): string
	return if #Text == 0 then Text else string.lower((string.sub(Text, 1, 1))) .. string.sub(Text, 2)
end