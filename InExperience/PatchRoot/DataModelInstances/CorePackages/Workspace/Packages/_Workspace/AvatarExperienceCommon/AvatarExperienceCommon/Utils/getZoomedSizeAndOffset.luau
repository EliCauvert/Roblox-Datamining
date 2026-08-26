return function(value, p1, p2)
	local var1 = if p2 then p2.X else 0.5
	local var2 = if p2 then p2.Y else 0.5
	local var3 = if p1 == 0 then value.X else value.X / p1
	local var4 = if p1 == 0 then value.Y else value.Y / p1
	
	return {
		offset = Vector2.new((value.X - var3) * var1, (value.Y - var4) * var2),
		size = Vector2.new(var3, var4)
	}
end