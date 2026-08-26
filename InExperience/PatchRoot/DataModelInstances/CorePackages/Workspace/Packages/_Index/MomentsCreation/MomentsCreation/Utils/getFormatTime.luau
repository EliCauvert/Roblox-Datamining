return function(p1)
	local maxValue = math.max(0, math.floor(p1))
	
	return string.format("%d:%02d", math.floor(maxValue / 60), maxValue % 60)
end