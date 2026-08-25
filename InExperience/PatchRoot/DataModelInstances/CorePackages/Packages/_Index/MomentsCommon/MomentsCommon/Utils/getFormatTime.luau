return function(p0)
	return string.format("%01d:%02d", math.floor(p0 / 60), math.floor(p0 % 60))
end