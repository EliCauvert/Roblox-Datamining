return function(p0) --[[ line: 4 ]]
	local tbl = setmetatable({}, {
		__index = function(p1, p2) --[[ line: 6 ]]
			return rawget(p1, p2:lower())
		end,
		__newindex = function(p3, p4, p5) --[[ line: 9 ]]
			rawset(p3, p4:lower(), p5)
		end
	})
	
	for i, v in pairs(p0) do
		tbl[i] = v
	end
	return tbl
end