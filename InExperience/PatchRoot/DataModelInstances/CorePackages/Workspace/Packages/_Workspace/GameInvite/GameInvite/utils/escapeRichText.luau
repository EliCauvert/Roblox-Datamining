local config = {
	["&"] = "&amp;",
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;",
	["'"] = "&apos;"
}

return function(Text: string): string --[[ Line: 10 | Named "escapeRichText" ]]
	-- upvalues: config (copy)
	return (string.gsub(Text, "[&<>\"']", config))
end