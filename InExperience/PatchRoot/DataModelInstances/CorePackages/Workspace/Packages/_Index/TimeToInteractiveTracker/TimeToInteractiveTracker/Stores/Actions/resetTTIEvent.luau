local _ = require(script.Parent.Parent.types)

return function(p0) --[[ line: 7 ]]
	return function(p1) --[[ line: 8 ]]
		-- upvalues: p0 (ref)
		p0(function(p2) --[[ line: 9 ]]
			-- upvalues: p1 (ref)
			local var0 = p2[p1]
			
			if var0 == nil then
				return p2
			end
			local cloned = table.clone(p2)
			cloned[p1] = {
				startTime = nil,
				endTime = nil,
				deltaMs = nil,
				sent = nil,
				metadata = table.clone(var0.metadata)
			}
			
			return cloned
		end)
	end
end