return function(p1: number, p2: number): number --[[ Line: 1 | Named "blendTransparencies" ]]
	return if p1 == nil then p2 or 0 elseif p2 == nil then p1 or 0 else 1 - (1 - p1) * (1 - p2)
end