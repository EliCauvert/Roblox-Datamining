return function(p1, p2, p3, p4, p5): boolean --[[ Line: 4 | Named "isSeeAllTileEnabled" ]]
	return not p1 and (if p5 then p2 ~= nil and p2 > p3 and p4 > p3 else false)
end