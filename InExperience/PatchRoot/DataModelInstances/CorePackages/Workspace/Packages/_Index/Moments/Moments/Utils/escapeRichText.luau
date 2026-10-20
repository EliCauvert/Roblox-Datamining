local config = { ["&"] = "&amp;", ["<"] = "&lt;", [">"] = "&gt;" }

return function(Text: string): string
	-- upvalues: config (copy)
	return (string.gsub(Text, "[&<>]", config))
end