return function(p1, p2, p3)
	if p1.X == 0 or p1.Y == 0 or (p2.X == 0 or p2.Y == 0) then
		return 1
	end
	local var1 = p2.X / p2.Y
	
	return (if p3 == Enum.ScaleType.Fit == (p1.X / p1.Y < var1) then p1.X else p1.Y * var1) / 1280
end