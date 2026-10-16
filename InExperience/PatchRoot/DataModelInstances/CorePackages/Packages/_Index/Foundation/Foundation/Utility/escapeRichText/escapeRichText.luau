return function(Text: string): string --[[ Line: 5 | Named "escapeRichText" ]]
	return Text:gsub("[&<>\"']", {
		["&"] = "&amp;",
		["<"] = "&lt;",
		[">"] = "&gt;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	})
end