return function(p1, p2, p3)
	return if p3 <= 0 then 0 else math.clamp((p1 - p2) / p3, 0, 1)
end