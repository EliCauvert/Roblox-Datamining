return function(p0, p1, p2)
	return p0 == nil or p0 == "" or (if p2 and string.find(utf8.nfdnormalize(p2):lower(), utf8.nfdnormalize(p0):lower(), 1, true) ~= nil then true else string.find(p1:lower(), p0:lower(), 1, true) ~= nil)
end