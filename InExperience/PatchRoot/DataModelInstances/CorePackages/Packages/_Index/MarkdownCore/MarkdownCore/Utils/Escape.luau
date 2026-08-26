return {
	escapeRichFormatting = function(p1)
		return p1:gsub("[&<>\"']", {
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
	end,
	unescapeRichFormatting = function(p1)
		return p1:gsub("&%l+;", {
			["&lt;"] = "<",
			["&gt;"] = ">",
			["&quot;"] = "\"",
			["&apos;"] = "'",
			["&amp;"] = "&"
		})
	end
}