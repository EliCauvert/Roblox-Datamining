return function(p0) --[[ line: 5 | named "escapeRichText" ]]
	return p0:gsub("[&<>\"']", {
		["&"] = "&amp;",
		["<"] = "&lt;",
		[">"] = "&gt;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	})
end