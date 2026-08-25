return function(p0, p1)
	local _, var0 = (p0 * p1:Inverse()):ToAxisAngle()
	
	return math.deg(var0)
end