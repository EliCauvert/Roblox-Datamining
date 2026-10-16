return function(Vector, Vector1, p1): number --[[ Line: 8 | Named "calculateIntersectionRatio" ]]
	local ScaledX = Vector1.X * Vector1.Y
	
	if ScaledX <= 0 then
		return 0
	else
		local NewVector = Vector + Vector1
		local XDelta = Vector1.X - (math.max(0, p1.min.X - Vector.X) + math.max(0, NewVector.X - p1.max.X))
		local YDelta = Vector1.Y - (math.max(0, p1.min.Y - Vector.Y) + math.max(0, NewVector.Y - p1.max.Y))
		
		return if XDelta <= 0 or YDelta <= 0 then 0 else XDelta * YDelta / ScaledX
	end
end