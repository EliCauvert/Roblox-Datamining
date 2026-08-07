return {
	isInRange = function(p0, p1, p2, p3) --[[ line: 3 ]]
		return if p3 == true then p1.X < p0.X and (p0.X < p2.X and (p1.Y < p0.Y and (p0.Y < p2.Y and (p1.Z < p0.Z and p0.Z < p2.Z)))) else p1.X <= p0.X and (p0.X <= p2.X and (p1.Y <= p0.Y and (p0.Y <= p2.Y and (p1.Z <= p0.Z and p0.Z <= p2.Z))))
	end,
	isFirstLessOrEqual = function(p4, p5) --[[ line: 10 ]]
		return p4.X <= p5.X and (p4.Y <= p5.Y and p4.Z <= p5.Z)
	end
}