return function(p0, p1, p2) --[[ line: 16 ]]
	return if p2 and p2 <= 0 then "" else string.sub(p0, p1, if p2 then p1 + p2 - 1 else nil)
end