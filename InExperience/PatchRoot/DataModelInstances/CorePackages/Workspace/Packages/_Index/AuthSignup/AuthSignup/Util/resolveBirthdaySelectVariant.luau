local function _(p1: number, p2) --[[ Line: 14 | Named "getManualSelectVariant" ]]
	return if p1 >= 0 then p1 else p2 or 0
end

return function(p1, p2: number, p3, p4): boolean --[[ Line: 21 | Named "resolveBirthdaySelectVariant" ]]
	return p1 and (p4 or 1) <= (if p2 >= 0 then p2 else p3 or 0)
end