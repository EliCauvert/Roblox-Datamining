return function(p1) --[[ Line: 8 ]]
	return function(_, p2) --[[ Line: 9 ]]
		-- upvalues: p1 (copy)
		return p2 or p1
	end
end