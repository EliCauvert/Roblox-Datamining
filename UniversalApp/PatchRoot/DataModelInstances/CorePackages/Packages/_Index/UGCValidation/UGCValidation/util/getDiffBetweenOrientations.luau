return function(p1, p2)
	local _, var1 = (p1 * p2:Inverse()):ToAxisAngle()
	
	return math.deg(var1)
end