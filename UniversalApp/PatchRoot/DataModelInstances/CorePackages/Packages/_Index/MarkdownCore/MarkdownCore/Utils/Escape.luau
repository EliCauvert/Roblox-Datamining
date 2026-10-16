return {
	escapeRichFormatting = function(Text: string) --[[ Line: 2 ]]
		return (Text:gsub("[&<>\"']", {
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
		}))
	end,
	unescapeRichFormatting = function(Text: string): string --[[ Line: 22 ]]
		return Text:gsub("&%l+;", {
			["&lt;"] = "<",
			["&gt;"] = ">",
			["&quot;"] = "\"",
			["&apos;"] = "'",
			["&amp;"] = "&"
		})
	end
}