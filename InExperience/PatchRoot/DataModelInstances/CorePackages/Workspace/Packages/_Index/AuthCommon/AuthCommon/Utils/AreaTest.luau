return {
	IsPointInRect = function(p1, p2)
		local min = p1.Min
		local max = p1.Max
		
		return min.X <= p2.X and (min.Y <= p2.Y and (p2.X <= max.X and p2.Y <= max.Y))
	end
}