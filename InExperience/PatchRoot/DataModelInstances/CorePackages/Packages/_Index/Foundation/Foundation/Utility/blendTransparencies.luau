return function(p0, p1)
	return if p0 == nil then p1 or 0 elseif p1 == nil then p0 or 0 else 1 - (1 - p0) * (1 - p1)
end