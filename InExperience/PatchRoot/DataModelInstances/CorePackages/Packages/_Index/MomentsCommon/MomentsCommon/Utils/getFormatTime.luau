return function(p0) --[[ line: 1 | named "getFormatTime" ]]
	return string.format("%01d:%02d", math.floor(p0 / 60), math.floor(p0 % 60))
end