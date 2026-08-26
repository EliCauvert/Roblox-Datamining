return {
	Priority = { Default = 1, Overlay = 2, Elevated = 3, Immediate = 4 },
	new = function(p1, p2, p3)
		return { id = p1, priority = p2, createdAt = tick(), data = p3 }
	end
}