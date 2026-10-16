local config = {
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;",
	["'"] = "&apos;"
}

return function(Text: string): string --[[ Line: 20 | Named "escapeRichText" ]]
	-- upvalues: config (copy)
	local Replaced = string.gsub(Text, "&", "&amp;")
	
	for i, value in config do
		Replaced = string.gsub(Replaced, i, value)
	end
	return Replaced
end