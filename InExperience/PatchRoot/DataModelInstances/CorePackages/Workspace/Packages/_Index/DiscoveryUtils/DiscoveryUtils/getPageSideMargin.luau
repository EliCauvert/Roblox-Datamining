return function(p1: number): number --[[ Line: 1 | Named "getPageSideMargin" ]]
	return if p1 > 600 then 48 elseif p1 > 320 then 24 else 12
end