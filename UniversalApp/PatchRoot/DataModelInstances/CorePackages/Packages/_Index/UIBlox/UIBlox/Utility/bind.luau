return function(p0, p1)
	return function(p2, ...)
		-- upvalues: p1 (ref), p0 (ref)
		return if p2 == p1 then p0(p1, ...) else p0(p1, p2, ...)
	end
end