local t = {
	["&lt;"] = "<",
	["&gt;"] = ">",
	["&quot;"] = "\"",
	["&apos;"] = "'",
	["&amp;"] = "&"
}

return function(p1)
	-- upvalues: t (ref)
	return p1:gsub("&%l+;", t)
end