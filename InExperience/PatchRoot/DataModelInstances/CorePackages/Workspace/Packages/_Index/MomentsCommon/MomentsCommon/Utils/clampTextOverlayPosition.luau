local function _(value, minValue, maxValue, p0) --[[ line: 1 | named "clampAxis" ]]
	if maxValue <= 0 or p0 <= 0 then
		return value
	end
	local var0 = minValue + p0 / 2
	local var1 = minValue + maxValue - p0 / 2
	
	return if var1 < var0 then minValue + maxValue / 2 else math.clamp(value, var0, var1)
end

return function(value, minValue, maxValue, p1, p2) --[[ line: 16 | named "clampTextOverlayPosition" ]]
	if minValue.X <= 0 or minValue.Y <= 0 then
		return value
	end
	local var8
	p1 = p1 or Vector2.zero
	p2 = p2 or minValue
	local var4 = value.X.Scale * minValue.X + value.X.Offset
	local var5 = value.Y.Scale * minValue.Y + value.Y.Offset
	local x = p1.X
	local x_1 = p2.X
	local x_2 = maxValue.X
	
	if x_1 <= 0 or x_2 <= 0 then
		var8 = var4
	else
		local var6 = x + x_2 / 2
		local var7 = x + x_1 - x_2 / 2
		var8 = if var7 < var6 then x + x_1 / 2 else math.clamp(var4, var6, var7)
	end
	local var11
	x_1 = p1.Y
	local y = p2.Y
	local y_1 = maxValue.Y
	
	if y <= 0 or y_1 <= 0 then
		var11 = var5
	else
		local var9 = x_1 + y_1 / 2
		local var10 = x_1 + y - y_1 / 2
		var11 = if var10 < var9 then x_1 + y / 2 else math.clamp(var5, var9, var10)
	end
	return UDim2.fromScale(var8 / minValue.X, var11 / minValue.Y)
end