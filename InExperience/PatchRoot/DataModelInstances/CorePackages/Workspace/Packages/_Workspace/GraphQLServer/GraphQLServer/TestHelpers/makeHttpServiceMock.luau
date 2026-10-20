return function(p1, p2)
	return {
		RequestInternal = function(_)
			-- upvalues: p1 (copy), p2 (copy)
			return {
				Start = function(_, Callback: (any, any) -> ())
					-- upvalues: p1 (upval), p2 (upval)
					Callback(p1, p2)
				end
			}
		end
	}
end