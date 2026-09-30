local t = { ["&"] = "&amp;", ["<"] = "&lt;", [">"] = "&gt;" }

return function(p1)
	-- upvalues: t (ref)
	return string.gsub(p1, "[&<>]", t)
end