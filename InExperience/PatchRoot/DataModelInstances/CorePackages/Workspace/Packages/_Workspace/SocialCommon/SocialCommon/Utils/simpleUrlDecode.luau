return function(p1)
	return p1:gsub("+", " "):gsub("%%(%x%x)", function(p2)
		return string.char(tonumber(p2, 16))
	end)
end