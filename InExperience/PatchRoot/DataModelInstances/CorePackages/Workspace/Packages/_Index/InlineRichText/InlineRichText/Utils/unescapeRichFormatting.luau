local config = {
	["&lt;"] = "<",
	["&gt;"] = ">",
	["&quot;"] = "\"",
	["&apos;"] = "'",
	["&amp;"] = "&"
}

return function(Text: string): string
	-- upvalues: config (copy)
	return (Text:gsub("&%l+;", config))
end