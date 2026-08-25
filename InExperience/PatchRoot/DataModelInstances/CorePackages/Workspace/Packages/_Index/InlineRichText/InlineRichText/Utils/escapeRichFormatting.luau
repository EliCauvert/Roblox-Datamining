return function(p0)
	return p0:gsub("[&<>\"']", {
		["&"] = "&amp;",
		["<"] = "&lt;",
		[">"] = "&gt;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	}):gsub("&amp;%l+;", {
		["&amp;lt;"] = "&lt;",
		["&amp;gt;"] = "&gt;",
		["&amp;quot;"] = "&quot;",
		["&amp;apos;"] = "&apos;",
		["&amp;amp;"] = "&amp;"
	})
end