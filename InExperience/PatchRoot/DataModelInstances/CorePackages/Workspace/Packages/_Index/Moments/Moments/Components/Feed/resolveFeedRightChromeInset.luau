return function(value, p1, p2)
	return if p1 == nil then math.max(value.right, p2) else math.max(value.right, p1)
end