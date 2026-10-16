return function(Text: string): string --[[ Line: 1 | Named "escapeRichText" ]]
	return (Text:gsub("[&<>\"']", {
		["&"] = "&amp;",
		["<"] = "&lt;",
		[">"] = "&gt;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	}))
end