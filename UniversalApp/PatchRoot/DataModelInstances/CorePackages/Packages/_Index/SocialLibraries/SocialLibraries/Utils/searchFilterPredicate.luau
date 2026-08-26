return function(p1, p2)
	return if p1 and p1 ~= "" then string.find(string.lower(p2), string.lower(p1), 1, true) ~= nil else true
end