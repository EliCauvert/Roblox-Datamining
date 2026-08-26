local _ = require(script.Parent.Parent.types)
local nowModule = require(script.Parent.Parent.Parent.Utils.now)

return function(p1)
	-- upvalues: nowModule (ref)
	local t = {}
	
	return function(p2, p3)
		-- upvalues: p1 (ref), nowModule (copy), t (ref)
		p1(function(p4)
			-- upvalues: p2 (ref), nowModule (copy), p3 (ref), t (copy)
			local var1 = p4[p2]
			local cloned = table.clone(p4)
			cloned[p2] = {
				endTime = nil,
				deltaMs = nil,
				sent = nil,
				startTime = nowModule(),
				metadata = if var1 ~= nil then {} else table.clone(var1.metadata)
			}
			
			if p3 then
				cloned[p2].metadata.coldStart = not t[p2]
				t[p2] = true
			end
			return cloned
		end)
	end
end