return function(p0) --[[ line: 1 ]]
	return string.gsub(p0, "%p", { ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;" })
end