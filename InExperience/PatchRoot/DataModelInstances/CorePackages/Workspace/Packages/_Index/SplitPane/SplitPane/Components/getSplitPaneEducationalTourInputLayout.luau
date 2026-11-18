return function(p1, p2, p3)
	return {
		isGamepadVideo = p1 and not p2,
		isGamepadPlacement = p1 and (not p2 or p3 == 3)
	}
end