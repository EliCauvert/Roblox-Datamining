return function(p0, p1) --[[ line: 1 ]]
	return if p0 and p0 ~= "" then string.find(string.lower(p1), string.lower(p0), 1, true) ~= nil else true
end