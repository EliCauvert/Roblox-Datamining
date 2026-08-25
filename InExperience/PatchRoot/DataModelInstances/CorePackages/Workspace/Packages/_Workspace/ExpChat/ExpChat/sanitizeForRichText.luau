return function(p0)
	return string.gsub(p0, "%p", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" })
end