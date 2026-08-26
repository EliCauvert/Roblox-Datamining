return function(p1, p2, p3)
	return if p2 > 0 then math.clamp(p3.Min + math.floor((p1 - p3.Min) / p2 + 0.5) * p2, p3.Min, p3.Max) else p1
end