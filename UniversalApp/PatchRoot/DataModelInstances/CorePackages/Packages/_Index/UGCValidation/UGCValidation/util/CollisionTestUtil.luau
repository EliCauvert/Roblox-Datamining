return {
	pointInAxisAlignedBounds = function(p1, p2, p3)
		local var1 = p1 - p2
		
		return -p3.X / 2 <= var1.X and (var1.X <= p3.X / 2 and (-p3.Y / 2 <= var1.Y and (var1.Y <= p3.Y / 2 and (-p3.Z / 2 <= var1.Z and var1.Z <= p3.Z / 2))))
	end
}