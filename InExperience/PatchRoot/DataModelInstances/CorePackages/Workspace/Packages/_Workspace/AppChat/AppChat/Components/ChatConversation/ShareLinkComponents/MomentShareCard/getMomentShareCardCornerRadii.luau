return function(p0, p1) --[[ line: 10 | named "getMomentShareCardCornerRadii" ]]
	return {
		bottomLeft = 0,
		bottomRight = 0,
		topLeft = if not p0 and p1 then 0 else 20,
		topRight = if not p0 and not p1 then 0 else 20
	}
end