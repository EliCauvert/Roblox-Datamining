return function(p1)
	if p1 < 0.5 then
		local var1 = math.max(p1, 0) / 0.5
		
		return {
			yOffset = 0,
			transparency = 0,
			isComplete = false,
			scale = if var1 < 0.6 then var1 * 1.2 / 0.6 else 1.2 - (var1 - 0.6) * 0.2 / 0.4
		}
	elseif p1 < 2.9 then
		return {
			scale = 1,
			transparency = 0,
			isComplete = false,
			yOffset = math.sin((p1 - 0.5) * 2 * 3.14159265359 * 1.25) * -6
		}
	end
	local minValue = math.min((p1 - 2.9) / 0.5, 1)
	local var2 = minValue * minValue
	
	return {
		scale = 1,
		yOffset = var2 * -24,
		transparency = var2,
		isComplete = p1 >= 3.4
	}
end