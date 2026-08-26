local _ = require(script.Parent.Parent.types)

return function(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		p1(function(p3)
			-- upvalues: p2 (ref)
			local var1 = p3[p2]
			
			if var1 == nil then
				return p3
			end
			local cloned = table.clone(p3)
			cloned[p2] = {
				startTime = nil,
				endTime = nil,
				deltaMs = nil,
				sent = nil,
				metadata = table.clone(var1.metadata)
			}
			
			return cloned
		end)
	end
end