return function(Text: string): string
	return (Text:gsub("%s*[\r\n]%s*", " "))
end