return function(p1)
	return function(_, p2)
		-- upvalues: p1 (copy)
		return p2 or p1
	end
end