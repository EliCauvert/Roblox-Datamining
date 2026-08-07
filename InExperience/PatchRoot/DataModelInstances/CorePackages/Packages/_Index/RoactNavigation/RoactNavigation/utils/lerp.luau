return function(startValue, endValue, alpha) --[[ line: 2 | named "lerp" ]]
	return startValue * (1 - alpha) + endValue * alpha
end