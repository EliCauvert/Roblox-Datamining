return function(p1, p2, p3)
	return if p3 and p3 <= 0 then "" else string.sub(p1, p2, if p3 then p2 + p3 - 1 else nil)
end