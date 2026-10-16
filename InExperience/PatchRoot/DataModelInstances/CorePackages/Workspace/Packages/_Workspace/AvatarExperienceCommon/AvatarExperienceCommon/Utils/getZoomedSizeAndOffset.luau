return function(Vector, p1, Vector1) --[[ Line: 7 | Named "getZoomedSizeAndOffset" ]]
	local X = if p1 == 0 then Vector.X else Vector.X / p1
	local Y = if p1 == 0 then Vector.Y else Vector.Y / p1
	
	return {
		offset = Vector2.new((Vector.X - X) * (if Vector1 then Vector1.X else 0.5), (Vector.Y - Y) * (if Vector1 then Vector1.Y else 0.5)),
		size = Vector2.new(X, Y)
	}
end