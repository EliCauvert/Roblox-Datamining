return function(p1): boolean
	return p1 == nil or (p1 == "" or (p1 == -1 or typeof(p1) == "table" and next(p1) == nil))
end