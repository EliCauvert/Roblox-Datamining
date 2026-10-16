return function(Vector, Vector1, ScaleType) --[[ Line: 3 | Named "getScale" ]]
	if Vector.X == 0 or Vector.Y == 0 or Vector1.X == 0 or Vector1.Y == 0 then
		return 1
	else
		local XRatio = Vector1.X / Vector1.Y
		local v1 = ScaleType == Enum.ScaleType.Fit == (Vector.X / Vector.Y < XRatio)
		
		return (if v1 then Vector.X else Vector.Y * XRatio) / 1280
	end
end