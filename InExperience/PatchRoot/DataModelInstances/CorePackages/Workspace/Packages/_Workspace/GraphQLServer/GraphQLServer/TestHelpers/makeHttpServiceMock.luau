return function(p1, p2)
	return {
		RequestInternal = function(_)
			-- upvalues: p1 (ref), p2 (ref)
			return {
				Start = function(_, p3)
					-- upvalues: p1 (copy), p2 (copy)
					p3(p1, p2)
				end
			}
		end
	}
end