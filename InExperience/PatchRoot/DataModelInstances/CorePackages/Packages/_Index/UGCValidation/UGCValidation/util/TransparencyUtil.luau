return {
	transformTriangleToWorld = function(vectorA, vectorB, p0, p1, p2) --[[ line: 10 ]]
		local var0 = p1 * (vectorA * p2)
		local var1 = p1 * (vectorB * p2)
		local var2 = p1 * (p0 * p2)
		
		return var0, var1, var2, (var1 - var0):Cross(var2 - var0).Unit
	end
}