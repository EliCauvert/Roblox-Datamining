local t = {
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;",
	["'"] = "&apos;"
}

return function(p0)
	-- upvalues: t (ref)
	local replaced = string.gsub(p0, "&", "&amp;")
	
	for i, v in t do
		replaced = string.gsub(replaced, i, v)
	end
	return replaced
end