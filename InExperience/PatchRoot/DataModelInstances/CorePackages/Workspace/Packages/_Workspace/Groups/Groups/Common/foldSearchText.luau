return function(Text: string): string
	return if utf8.len(Text) == nil then string.lower(Text) else string.lower(utf8.nfdnormalize(Text))
end