return function(p1)
	return if p1 == nil then nil else p1 == "true" or (p1 == "True" or p1 == "1")
end