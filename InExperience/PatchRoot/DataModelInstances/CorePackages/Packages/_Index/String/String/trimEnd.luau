return function(Text: string): string
	return (Text:gsub("[%s]+$", ""))
end