return function(value, p0, p1, p2) --[[ line: 15 | named "getCenterScrollOffset" ]]
	if p2 <= 0 then
		return nil
	end
	local maxValue = math.max(0, value + p0 * 0.5 - p2 * 0.5)
	
	return if math.abs(maxValue - p1) < 1 then nil else maxValue
end