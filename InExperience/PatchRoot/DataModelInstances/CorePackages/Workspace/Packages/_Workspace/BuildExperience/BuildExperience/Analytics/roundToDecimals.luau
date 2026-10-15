return function(value, p1)
	local var1 = 10 ^ p1
	
	return math.floor(value * var1 + 0.5) / var1
end