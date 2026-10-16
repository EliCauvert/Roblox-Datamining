local config = {
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;",
	["'"] = "&apos;"
}

return function(Text: string) --[[ Line: 11 ]]
	-- upvalues: config (copy)
	local Text1 = Text:gsub("&", "&amp;")
	
	for i, value in pairs(config) do
		Text1 = Text1:gsub(i, value)
	end
	return Text1
end