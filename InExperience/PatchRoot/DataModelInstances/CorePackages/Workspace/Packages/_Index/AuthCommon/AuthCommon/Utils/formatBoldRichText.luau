local config = {
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;",
	["'"] = "&apos;"
}

return function(Text: string): string --[[ Line: 11 | Named "formatBoldRichText" ]]
	-- upvalues: config (copy)
	local Replaced = string.gsub(Text, "&", "&amp;")
	
	for i, value in config do
		Replaced = string.gsub(Replaced, i, value)
	end
	return `<b>{Replaced}</b>`
end