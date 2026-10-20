return function(p1)
	return {
		GetItem = function(_, _)
			-- upvalues: p1 (copy)
			return if p1 then p1 else "true"
		end,
		SetItem = function(_, _, _) end,
		Flush = function(_) end
	}
end