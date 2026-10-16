return function(p1, p2, p3) --[[ Line: 1 ]]
	return if p1 and p2 and p3 and p3 ~= 0 then p2 + math.ceil(p1 / p3) - 1 else nil
end