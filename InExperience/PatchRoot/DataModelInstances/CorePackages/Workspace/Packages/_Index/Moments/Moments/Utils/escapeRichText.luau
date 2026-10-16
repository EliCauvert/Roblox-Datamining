local config = { ["&"] = "&amp;", ["<"] = "&lt;", [">"] = "&gt;" }

return function(Text: string): string --[[ Line: 9 | Named "escapeRichText" ]]
	-- upvalues: config (copy)
	return (string.gsub(Text, "[&<>]", config))
end