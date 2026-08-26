return function(p1, p2)
	return p2 == "" or (if p1 == nil or p1 == "" then false else string.find(string.lower(p1), string.lower(p2), 1, true) ~= nil)
end