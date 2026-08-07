return function(p0) --[[ line: 7 | named "getFormatTime" ]]
	local maxValue = math.max(0, math.floor(p0))
	
	return string.format("%d:%02d", math.floor(maxValue / 60), maxValue % 60)
end