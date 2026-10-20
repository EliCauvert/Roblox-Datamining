return function(Text: string): string
	return string.gsub(Text, "\n\n*", "\n")
end