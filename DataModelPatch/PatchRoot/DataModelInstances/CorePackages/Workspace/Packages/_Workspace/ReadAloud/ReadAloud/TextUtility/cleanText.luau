return function(Text: string): string
	return (Text:gsub("[^ -~\n]", ""))
end