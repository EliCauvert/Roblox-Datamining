return {
	point = function(p1, p2, p3)
		return p1 + (p2 - p1) * p3
	end,
	arc = function(p1: number, p2: number): number
		return p2 * -4 * p1 * (1 - p1)
	end
}