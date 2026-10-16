return function(Text: string): string --[[ Line: 16 ]]
	return (Text:gsub("[%s]+$", ""))
end