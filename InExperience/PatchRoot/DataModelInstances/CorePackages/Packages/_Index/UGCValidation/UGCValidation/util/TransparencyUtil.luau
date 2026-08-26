return {
	transformTriangleToWorld = function(vectorA, vectorB, p1, p2, p3)
		local var1 = p2 * (vectorA * p3)
		local var2 = p2 * (vectorB * p3)
		local var3 = p2 * (p1 * p3)
		
		return var1, var2, var3, (var2 - var1):Cross(var3 - var1).Unit
	end
}