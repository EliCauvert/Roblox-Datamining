return {
	isInRange = function(p1, p2, p3, p4)
		return if p4 == true then p2.X < p1.X and (p1.X < p3.X and (p2.Y < p1.Y and (p1.Y < p3.Y and (p2.Z < p1.Z and p1.Z < p3.Z)))) else p2.X <= p1.X and (p1.X <= p3.X and (p2.Y <= p1.Y and (p1.Y <= p3.Y and (p2.Z <= p1.Z and p1.Z <= p3.Z))))
	end,
	isFirstLessOrEqual = function(p1, p2)
		return p1.X <= p2.X and (p1.Y <= p2.Y and p1.Z <= p2.Z)
	end
}