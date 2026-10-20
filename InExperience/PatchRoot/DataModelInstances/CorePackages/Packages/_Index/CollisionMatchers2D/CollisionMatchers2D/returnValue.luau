return function(Pass, p1, p2)
	return { pass = Pass, message = Pass and p1 or (p2 or p1) }
end