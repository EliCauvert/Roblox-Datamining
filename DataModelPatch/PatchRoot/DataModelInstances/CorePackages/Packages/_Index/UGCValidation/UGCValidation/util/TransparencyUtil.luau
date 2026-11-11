return {
	transformTriangleToWorld = function(p1, p2, p3, p4, p5)
		local v1 = p4 * (p1 * p5)
		local v2 = p4 * (p2 * p5)
		local v3 = p4 * (p3 * p5)
		
		return v1, v2, v3, (v2 - v1):Cross(v3 - v1).Unit
	end
}