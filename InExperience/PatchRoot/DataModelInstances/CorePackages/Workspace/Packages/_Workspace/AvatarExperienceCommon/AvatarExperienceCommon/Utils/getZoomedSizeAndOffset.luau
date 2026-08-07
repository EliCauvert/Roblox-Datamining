return function(value, p0, p1) --[[ line: 7 | named "getZoomedSizeAndOffset" ]]
	local var0 = if p1 then p1.X else 0.5
	local var1 = if p1 then p1.Y else 0.5
	local var2 = if p0 == 0 then value.X else value.X / p0
	local var3 = if p0 == 0 then value.Y else value.Y / p0
	
	return {
		offset = Vector2.new((value.X - var2) * var0, (value.Y - var3) * var1),
		size = Vector2.new(var2, var3)
	}
end