local config = {
	["&"] = "&amp;",
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;",
	["'"] = "&apos;"
}

return table.freeze({
	escape = function(Text: string): string
		-- upvalues: config (copy)
		assert(type(Text) == "string", "Facet richText.escape takes a string")
		
		return (string.gsub(Text, "[&<>\"']", config))
	end
})