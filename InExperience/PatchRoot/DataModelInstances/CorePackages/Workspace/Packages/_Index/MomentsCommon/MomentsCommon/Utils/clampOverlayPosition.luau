local function _(value, minValue, maxValue, p1)
	if maxValue <= 0 or p1 <= 0 then
		return value
	end
	local var1 = minValue + p1 / 2
	local var2 = minValue + maxValue - p1 / 2
	
	return if var2 < var1 then minValue + maxValue / 2 else math.clamp(value, var1, var2)
end

return function(value, minValue, maxValue, p1, p2)
	if minValue.X <= 0 or minValue.Y <= 0 then
		return value
	end
	local var1
	p1 = p1 or Vector2.zero
	p2 = p2 or minValue
	local var2 = value.X.Scale * minValue.X + value.X.Offset
	local var3 = value.Y.Scale * minValue.Y + value.Y.Offset
	local x = p1.X
	local x_1 = p2.X
	local x_2 = maxValue.X
	
	if x_1 <= 0 or x_2 <= 0 then
		var1 = var2
	else
		local var4 = x + x_2 / 2
		local var5 = x + x_1 - x_2 / 2
		var1 = if var5 < var4 then x + x_1 / 2 else math.clamp(var2, var4, var5)
	end
	local var6
	x_1 = p1.Y
	local y = p2.Y
	local y_1 = maxValue.Y
	
	if y <= 0 or y_1 <= 0 then
		var6 = var3
	else
		local var7 = x_1 + y_1 / 2
		local var8 = x_1 + y - y_1 / 2
		var6 = if var8 < var7 then x_1 + y / 2 else math.clamp(var3, var7, var8)
	end
	return UDim2.fromScale(var1 / minValue.X, var6 / minValue.Y)
end