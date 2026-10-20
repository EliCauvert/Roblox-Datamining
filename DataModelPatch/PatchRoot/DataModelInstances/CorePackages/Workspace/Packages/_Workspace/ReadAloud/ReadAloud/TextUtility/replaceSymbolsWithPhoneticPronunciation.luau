return function(Text: string)
	return (Text:gsub("%%", " percent"):gsub("(%d)%.(%d)", "%1 point %2"))
end