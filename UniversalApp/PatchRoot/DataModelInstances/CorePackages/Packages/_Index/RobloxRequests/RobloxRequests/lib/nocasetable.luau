return function(p1)
	local tbl = setmetatable({}, {
		__index = function(p2, p3)
			return rawget(p2, p3:lower())
		end,
		__newindex = function(p2, p3, p4)
			rawset(p2, p3:lower(), p4)
		end
	})
	
	for i, v in pairs(p1) do
		tbl[i] = v
	end
	return tbl
end