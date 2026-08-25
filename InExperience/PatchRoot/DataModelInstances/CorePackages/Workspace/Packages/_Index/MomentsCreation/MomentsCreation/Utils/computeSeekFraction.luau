return function(p0, p1, p2)
	return if p2 <= 0 then 0 else math.clamp((p0 - p1) / p2, 0, 1)
end