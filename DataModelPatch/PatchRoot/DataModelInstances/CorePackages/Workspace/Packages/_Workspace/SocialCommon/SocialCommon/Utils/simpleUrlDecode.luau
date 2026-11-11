return function(Text: string)
	return (Text:gsub("+", " "):gsub("%%(%x%x)", function(p1): string
		return (string.char((tonumber(p1, 16))))
	end))
end