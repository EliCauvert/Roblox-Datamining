local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local fFlagAXTTIEnableColdWarmDetection = require(timeToInteractiveTracker.Parent.SharedFlags).FFlagAXTTIEnableColdWarmDetection
local _ = require(script.Parent.Parent.types)
local nowModule = require(script.Parent.Parent.Parent.Utils.now)
local fFlagTTITrackerMemoryTrackingModule = require(timeToInteractiveTracker.Utils.FFlagTTITrackerMemoryTracking)

return function(p0) --[[ line: 18 ]]
	-- upvalues: fFlagTTITrackerMemoryTrackingModule (ref), nowModule (ref), fFlagAXTTIEnableColdWarmDetection (ref)
	local t = {}
	
	return function(p1, p2) --[[ line: 24 ]]
		-- upvalues: fFlagTTITrackerMemoryTrackingModule (copy), p0 (ref), nowModule (copy), fFlagAXTTIEnableColdWarmDetection (copy), t (ref)
		local var6
		local _ = nil
		local var4 = nil
		
		if fFlagTTITrackerMemoryTrackingModule then
			local var5 = if type(p2) == "boolean" then { autoDetectColdVsWarm = p2 } else p2
			var6 = if var5 then var5.autoDetectColdVsWarm else nil
			var4 = if var5 then var5.trackMemory else nil
		else
			var6 = if type(p2) == "boolean" then p2 else nil
		end
		p0(function(p3) --[[ line: 39 ]]
			-- upvalues: p1 (ref), nowModule (copy), var4 (write), fFlagAXTTIEnableColdWarmDetection (copy), var6 (write), t (copy)
			local var7 = p3[p1]
			local cloned = table.clone(p3)
			cloned[p1] = {
				endTime = nil,
				deltaMs = nil,
				sent = nil,
				startTime = nowModule(),
				trackMemory = var4,
				metadata = if var7 ~= nil then {} else table.clone(var7.metadata)
			}
			
			if fFlagAXTTIEnableColdWarmDetection and var6 then
				cloned[p1].metadata.coldStart = not t[p1]
				t[p1] = true
			end
			return cloned
		end)
	end
end