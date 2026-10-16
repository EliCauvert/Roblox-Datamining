return function(p1, p2: number, p3): number --[[ Line: 1 | Named "getConversationRowHeight" ]]
	return p1 + (if p3 then p2 * 2 else 0)
end