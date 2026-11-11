return function(p1, p2, p3): number
	local MinRatio = (p1 - p3.Min) / p2
	local Rounded = math.round(MinRatio)
	
	return if math.abs(MinRatio - Rounded) < 0.000000001 then Rounded else MinRatio
end