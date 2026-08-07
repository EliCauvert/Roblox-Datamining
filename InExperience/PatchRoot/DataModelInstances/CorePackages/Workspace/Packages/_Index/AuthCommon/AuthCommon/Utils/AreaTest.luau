return {
	IsPointInRect = function(p0, p1) --[[ line: 4 ]]
		local min = p0.Min
		local max = p0.Max
		
		return min.X <= p1.X and (min.Y <= p1.Y and (p1.X <= max.X and p1.Y <= max.Y))
	end
}