return function(p1, p2): number
	local _, Angle = (p1 * p2:Inverse()):ToAxisAngle()
	
	return (math.deg(Angle))
end