return function(p0, p1) --[[ line: 1 | named "makeHttpServiceMock" ]]
	return {
		RequestInternal = function(_) --[[ line: 3 ]]
			-- upvalues: p0 (ref), p1 (ref)
			return {
				Start = function(_, p2) --[[ line: 5 ]]
					-- upvalues: p0 (copy), p1 (copy)
					p2(p0, p1)
				end
			}
		end
	}
end