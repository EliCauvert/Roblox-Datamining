return function(p0, p1) --[[ line: 3 | named "getDiffBetweenOrientations" ]]
	local _, var0 = (p0 * p1:Inverse()):ToAxisAngle()
	
	return math.deg(var0)
end