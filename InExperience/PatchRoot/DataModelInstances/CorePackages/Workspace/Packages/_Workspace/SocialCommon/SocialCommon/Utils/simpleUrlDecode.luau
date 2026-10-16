return function(Text: string) --[[ Line: 2 ]]
	return (Text:gsub("+", " "):gsub("%%(%x%x)", function(p1): string --[[ Line: 3 ]]
		return (string.char((tonumber(p1, 16))))
	end))
end