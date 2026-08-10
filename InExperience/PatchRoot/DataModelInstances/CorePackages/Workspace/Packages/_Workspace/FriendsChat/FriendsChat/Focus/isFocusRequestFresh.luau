return function(p0, p1, p2) --[[ line: 10 | named "isFocusRequestFresh" ]]
	return if p0 == nil then false else p1 - p0 <= p2
end