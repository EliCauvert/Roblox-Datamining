return function(p1, p2)
	return {
		topLeft = if p1.topLeft then p2 else 0,
		topRight = if p1.topRight then p2 else 0,
		bottomLeft = if p1.bottomLeft then p2 else 0,
		bottomRight = if p1.bottomRight then p2 else 0
	}
end