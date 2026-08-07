return function(p0) --[[ line: 2 ]]
	return p0:gsub("+", " "):gsub("%%(%x%x)", function(p1) --[[ line: 3 ]]
		return string.char(tonumber(p1, 16))
	end)
end