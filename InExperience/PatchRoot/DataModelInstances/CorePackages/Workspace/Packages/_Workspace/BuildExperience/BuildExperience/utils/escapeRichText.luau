local t = {
	["&"] = "&amp;",
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;",
	["'"] = "&apos;"
}

return function(p1)
	-- upvalues: t (ref)
	return string.gsub(p1, "[&<>\"']", t)
end