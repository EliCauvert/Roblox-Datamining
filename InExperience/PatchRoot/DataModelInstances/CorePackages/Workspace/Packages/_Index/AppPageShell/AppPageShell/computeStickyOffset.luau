return function(value, p1, p2)
	local minValue = math.min(math.floor(value - p1), 0)
	
	return if p2 == nil or p2 <= 0 or p2 >= p1 then minValue else math.max(minValue, p2 - p1)
end