local fFlagAXTTIEnableColdWarmDetection = require(script:FindFirstAncestor("TimeToInteractiveTracker").Parent.SharedFlags).FFlagAXTTIEnableColdWarmDetection
local _ = require(script.Parent.Parent.types)
local nowModule = require(script.Parent.Parent.Parent.Utils.now)

return function(p0) --[[ line: 16 ]]
	-- upvalues: nowModule (ref), fFlagAXTTIEnableColdWarmDetection (ref)
	local t = {}
	
	return function(p1, p2) --[[ line: 22 ]]
		-- upvalues: p0 (ref), nowModule (copy), fFlagAXTTIEnableColdWarmDetection (copy), t (ref)
		p0(function(p3) --[[ line: 23 ]]
			-- upvalues: p1 (ref), nowModule (copy), fFlagAXTTIEnableColdWarmDetection (copy), p2 (ref), t (copy)
			local var2 = p3[p1]
			local cloned = table.clone(p3)
			cloned[p1] = {
				endTime = nil,
				deltaMs = nil,
				sent = nil,
				startTime = nowModule(),
				metadata = if var2 ~= nil then {} else table.clone(var2.metadata)
			}
			
			if fFlagAXTTIEnableColdWarmDetection and p2 then
				cloned[p1].metadata.coldStart = not t[p1]
				t[p1] = true
			end
			return cloned
		end)
	end
end