return function(p0, p1) --[[ line: 15 | named "getCornerRadii" ]]
	return {
		topLeft = if p0.topLeft then p1 else 0,
		topRight = if p0.topRight then p1 else 0,
		bottomLeft = if p0.bottomLeft then p1 else 0,
		bottomRight = if p0.bottomRight then p1 else 0
	}
end