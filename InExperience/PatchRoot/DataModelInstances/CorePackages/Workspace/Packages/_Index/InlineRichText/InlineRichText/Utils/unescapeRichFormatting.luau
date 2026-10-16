local config = {
	["&lt;"] = "<",
	["&gt;"] = ">",
	["&quot;"] = "\"",
	["&apos;"] = "'",
	["&amp;"] = "&"
}

return function(Text: string): string --[[ Line: 14 | Named "unescapeRichFormatting" ]]
	-- upvalues: config (copy)
	return (Text:gsub("&%l+;", config))
end