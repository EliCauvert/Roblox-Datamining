return function(p0)
	return function(_, p1)
		-- upvalues: p0 (ref)
		return p1 or p0
	end
end