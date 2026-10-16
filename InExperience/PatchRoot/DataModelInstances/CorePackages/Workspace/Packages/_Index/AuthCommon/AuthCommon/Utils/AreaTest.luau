return {
	IsPointInRect = function(p1, Vector): boolean --[[ Line: 4 ]]
		local Min = p1.Min
		local Max = p1.Max
		
		return Min.X <= Vector.X and (Min.Y <= Vector.Y and Vector.X <= Max.X) and Vector.Y <= Max.Y
	end
}