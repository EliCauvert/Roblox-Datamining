return {
	clampBetween0And1 = function(Value: number)
		if math.abs(Value) < 0.001 then
			return 0, false
		elseif math.abs(Value - 1) < 0.001 then
			return 1, false
		elseif Value >= 0 and Value <= 1 then
			return Value, false
		else
			return math.clamp(Value, 0, 1), true
		end
	end
}