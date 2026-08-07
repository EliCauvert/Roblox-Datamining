return function(p0, p1, p2, p3, p4) --[[ line: 4 | named "isSeeAllTileEnabled" ]]
	return if p0 then false elseif p4 then p1 == nil or p1 <= p2 or p3 <= p2 else false
end