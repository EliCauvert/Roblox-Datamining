return function(p0, p1)
	return {
		RequestInternal = function(_)
			-- upvalues: p0 (ref), p1 (ref)
			return {
				Start = function(_, p2)
					-- upvalues: p0 (copy), p1 (copy)
					p2(p0, p1)
				end
			}
		end
	}
end