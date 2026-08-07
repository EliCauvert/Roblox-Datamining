return function(p0) --[[ line: 8 ]]
	return function(_, p1) --[[ line: 9 ]]
		-- upvalues: p0 (ref)
		return p1 or p0
	end
end