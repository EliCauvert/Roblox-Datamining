return function(p1, p2, p3): boolean --[[ Line: 10 | Named "isFocusRequestFresh" ]]
	return p1 ~= nil and p2 - p1 <= p3
end