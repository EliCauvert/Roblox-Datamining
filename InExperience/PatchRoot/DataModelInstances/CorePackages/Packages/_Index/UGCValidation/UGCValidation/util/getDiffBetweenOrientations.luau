return function(p1, p2): number --[[ Line: 3 | Named "getDiffBetweenOrientations" ]]
	local _, Angle = (p1 * p2:Inverse()):ToAxisAngle()
	
	return (math.deg(Angle))
end