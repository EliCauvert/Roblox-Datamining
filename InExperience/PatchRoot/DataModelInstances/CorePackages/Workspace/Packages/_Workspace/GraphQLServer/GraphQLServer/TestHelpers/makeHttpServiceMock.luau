return function(p1, p2) --[[ Line: 1 | Named "makeHttpServiceMock" ]]
	return {
		RequestInternal = function(_) --[[ Line: 3 ]]
			-- upvalues: p1 (copy), p2 (copy)
			return {
				Start = function(_, Callback: (any, any) -> ()) --[[ Line: 5 ]]
					-- upvalues: p1 (upval), p2 (upval)
					Callback(p1, p2)
				end
			}
		end
	}
end