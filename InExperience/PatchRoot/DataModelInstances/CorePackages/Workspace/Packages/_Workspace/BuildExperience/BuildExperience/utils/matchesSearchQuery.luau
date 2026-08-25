return function(p0, p1)
	return p1 == "" or (if p0 == nil or p0 == "" then false else string.find(string.lower(p0), string.lower(p1), 1, true) ~= nil)
end