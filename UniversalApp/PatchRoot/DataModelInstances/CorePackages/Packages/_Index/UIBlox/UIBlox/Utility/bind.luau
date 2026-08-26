return function(p1, p2)
	return function(p3, ...)
		-- upvalues: p2 (ref), p1 (ref)
		return if p3 == p2 then p1(p2, ...) else p1(p2, p3, ...)
	end
end