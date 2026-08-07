return function(p0, p1, p2) --[[ line: 1 | named "calculateSliderStepValue" ]]
	return if p1 > 0 then math.clamp(p2.Min + math.floor((p0 - p2.Min) / p1 + 0.5) * p1, p2.Min, p2.Max) else p0
end