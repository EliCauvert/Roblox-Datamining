return function(Text: string): string
	return Text:gsub("[&<>\"']", {
		["&"] = "&amp;",
		["<"] = "&lt;",
		[">"] = "&gt;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	})
end