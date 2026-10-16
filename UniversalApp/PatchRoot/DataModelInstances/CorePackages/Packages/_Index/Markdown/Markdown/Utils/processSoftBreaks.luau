return function(Text: string): string --[[ Line: 5 | Named "processSoftBreaks" ]]
	return (Text:gsub("%s*[\r\n]%s*", " "))
end