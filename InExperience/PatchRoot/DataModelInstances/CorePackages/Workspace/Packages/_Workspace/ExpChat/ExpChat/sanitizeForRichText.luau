return function(p1)
	return string.gsub(p1, "%p", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" })
end