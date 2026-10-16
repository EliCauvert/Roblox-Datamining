return function(p1, p2: number): number --[[ Line: 1 | Named "getItemCountForRow" ]]
	return (math.floor(p1 / math.max(1, p2)))
end