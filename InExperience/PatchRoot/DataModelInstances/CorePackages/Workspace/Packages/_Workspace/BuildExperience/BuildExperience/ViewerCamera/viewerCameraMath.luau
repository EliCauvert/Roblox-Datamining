return {
	grab = function(p1, p2, p3, Vector)
		local DotProduct = (p1.Position - p2):Dot(p3)
		local v1 = p3
		
		if DotProduct < 0 then
			v1 = -p3
			DotProduct = -DotProduct
		end
		local DotProduct1: number = Vector:Dot(v1)
		
		return if DotProduct < 0.001 or DotProduct1 > -0.05 then nil else CFrame.new(p2 - Vector * (DotProduct / -DotProduct1)) * p1.Rotation
	end
}