return function(p1)
	return function(_, p2)
		-- upvalues: p1 (ref)
		return p2 or p1
	end
end