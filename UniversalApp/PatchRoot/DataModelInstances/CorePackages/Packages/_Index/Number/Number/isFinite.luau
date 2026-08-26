return function(p1)
	return typeof(p1) == "number" and (p1 == p1 and (p1 ~= 1e999 and p1 ~= -1e999))
end