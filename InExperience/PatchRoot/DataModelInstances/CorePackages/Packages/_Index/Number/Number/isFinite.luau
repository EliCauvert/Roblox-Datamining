return function(p0)
	return typeof(p0) == "number" and (p0 == p0 and (p0 ~= 1e999 and p0 ~= -1e999))
end