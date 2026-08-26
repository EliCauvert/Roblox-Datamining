return function(p1, p2, p3)
	return p1 == nil or p1 == "" or (if p3 and string.find(utf8.nfdnormalize(p3):lower(), utf8.nfdnormalize(p1):lower(), 1, true) ~= nil then true else string.find(p2:lower(), p1:lower(), 1, true) ~= nil)
end