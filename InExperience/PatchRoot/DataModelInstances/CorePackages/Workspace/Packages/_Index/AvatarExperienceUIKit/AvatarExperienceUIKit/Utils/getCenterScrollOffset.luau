return function(value, p1, p2, p3)
	if p3 <= 0 then
		return nil
	end
	local maxValue = math.max(0, value + p1 * 0.5 - p3 * 0.5)
	
	return if math.abs(maxValue - p2) < 1 then nil else maxValue
end