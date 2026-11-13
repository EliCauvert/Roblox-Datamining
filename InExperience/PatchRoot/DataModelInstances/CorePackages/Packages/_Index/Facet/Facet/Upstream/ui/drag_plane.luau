return function(p1, Vector, CF)
	local UpVector = CF.UpVector
	local DotProduct: number = Vector:Dot(UpVector)
	
	if math.abs(DotProduct) < 0.000001 then
		return nil
	else
		local DotProductRatio = (CF.Position - p1):Dot(UpVector) / DotProduct
		
		return if DotProductRatio >= 0 then p1 + Vector * DotProductRatio else nil
	end
end