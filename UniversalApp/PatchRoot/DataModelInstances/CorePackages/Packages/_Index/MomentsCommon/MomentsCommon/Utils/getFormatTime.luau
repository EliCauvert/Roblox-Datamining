return function(p1)
	return string.format("%01d:%02d", math.floor(p1 / 60), math.floor(p1 % 60))
end