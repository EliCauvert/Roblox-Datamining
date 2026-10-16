return {
	pointInAxisAlignedBounds = function(p1, p2, Vector): boolean --[[ Line: 7 ]]
		local Vector1 = p1 - p2
		
		return -Vector.X / 2 <= Vector1.X and (Vector1.X <= Vector.X / 2 and (-Vector.Y / 2 <= Vector1.Y and (Vector1.Y <= Vector.Y / 2 and -Vector.Z / 2 <= Vector1.Z))) and Vector1.Z <= Vector.Z / 2
	end
}