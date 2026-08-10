return function(p0, p1, p2) --[[ line: 7 | named "calculateSliderValueFromDelta" ]]
	return math.clamp(p0 + p1 * (p2.Max - p2.Min), p2.Min, p2.Max)
end