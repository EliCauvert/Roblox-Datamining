return function(p0, p1, p2)
	return { pass = p0, message = if p0 then p1 else p2 or p1 }
end