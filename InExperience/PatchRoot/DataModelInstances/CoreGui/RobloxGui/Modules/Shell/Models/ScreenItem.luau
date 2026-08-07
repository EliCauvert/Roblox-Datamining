return {
	Priority = { Default = 1, Overlay = 2, Elevated = 3, Immediate = 4 },
	new = function(p0, p1, p2) --[[ line: 10 ]]
		return { id = p0, priority = p1, createdAt = tick(), data = p2 }
	end
}