local _ = require(script.Parent.Parent.types)

return function(p0)
	return function(p1)
		-- upvalues: p0 (ref)
		p0(function(p2)
			-- upvalues: p1 (ref)
			if p2[p1] == nil then
				return p2
			end
			local cloned = table.clone(p2)
			cloned[p1] = nil
			
			return cloned
		end)
	end
end