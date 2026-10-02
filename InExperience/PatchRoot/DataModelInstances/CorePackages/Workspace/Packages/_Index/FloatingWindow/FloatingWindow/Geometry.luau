local function _(value, minValue, maxValue)
	return if maxValue <= minValue then (minValue + maxValue) / 2 else math.clamp(value, minValue, maxValue)
end

return {
	hasPositiveSize = function(p1)
		return p1.X > 0 and p1.Y > 0
	end,
	resolveCenter = function(p1, p2)
		return Vector2.new(p1.X.Scale * p2.X + p1.X.Offset, p1.Y.Scale * p2.Y + p1.Y.Offset)
	end,
	clampCenter = function(value, minValue, maxValue)
		local var1 = maxValue / 2
		local new = Vector2.new
		local x = value.X
		local x_1 = var1.X
		local var2 = minValue.X - var1.X
		local var3 = if var2 <= x_1 then (x_1 + var2) / 2 else math.clamp(x, x_1, var2)
		local y = value.Y
		local y_1 = var1.Y
		local var4 = minValue.Y - var1.Y
		
		return new(var3, if var4 <= y_1 then (y_1 + var4) / 2 else math.clamp(y, y_1, var4))
	end
}