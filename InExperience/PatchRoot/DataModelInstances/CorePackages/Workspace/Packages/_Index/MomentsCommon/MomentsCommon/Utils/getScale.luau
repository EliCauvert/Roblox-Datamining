return function(p0, p1, p2)
	if p0.X == 0 or p0.Y == 0 or (p1.X == 0 or p1.Y == 0) then
		return 1
	end
	local var0 = p1.X / p1.Y
	
	return (if p2 == Enum.ScaleType.Fit == (p0.X / p0.Y < var0) then p0.X else p0.Y * var0) / 1280
end