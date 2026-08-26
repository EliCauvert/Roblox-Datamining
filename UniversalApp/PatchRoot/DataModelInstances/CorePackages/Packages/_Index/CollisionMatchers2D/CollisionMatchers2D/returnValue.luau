return function(p1, p2, p3)
	return { pass = p1, message = if p1 then p2 else p3 or p2 }
end