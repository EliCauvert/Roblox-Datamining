local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local name = require(timeToInteractiveTracker.Logger):new(script.Name)
local fFlagDebugTimeToInteractiveTrackerModule = require(timeToInteractiveTracker.Utils.FFlagDebugTimeToInteractiveTracker)
local fFlagTimeToInteractiveTrackerWarningsRequireDebugModule = require(timeToInteractiveTracker.Utils.FFlagTimeToInteractiveTrackerWarningsRequireDebug)
local _ = require(script.Parent.Parent.types)
local nowModule = require(timeToInteractiveTracker.Utils.now)
local getMemoryMbModule = require(timeToInteractiveTracker.Utils.getMemoryMb)
local fFlagTTITrackerMemoryTrackingModule = require(timeToInteractiveTracker.Utils.FFlagTTITrackerMemoryTracking)

return function(p0, p1)
	-- upvalues: nowModule (ref), fFlagTimeToInteractiveTrackerWarningsRequireDebugModule (ref), fFlagDebugTimeToInteractiveTrackerModule (ref), name (ref), fFlagTTITrackerMemoryTrackingModule (ref), getMemoryMbModule (ref)
	return function(p2, p3, p4)
		-- upvalues: nowModule (copy), p0 (ref), fFlagTimeToInteractiveTrackerWarningsRequireDebugModule (copy), fFlagDebugTimeToInteractiveTrackerModule (copy), name (copy), fFlagTTITrackerMemoryTrackingModule (copy), getMemoryMbModule (copy), p1 (ref)
		local var7 = nowModule()
		local var8 = p0(false)[p2]
		
		if var8 and var8.startTime then
			local var9 = if fFlagTTITrackerMemoryTrackingModule then getMemoryMbModule() else nil
			local t = {
				name = p3,
				id = if p4 then p4.id else nil,
				timestamp = var7,
				deltaMs = (var7 - var8.startTime) * 1000,
				totalMemoryMB = if var9 then var9.totalMemoryMB else nil,
				luaHeapMB = if var9 then var9.luaHeapMB else nil
			}
			p1(function(p5)
				-- upvalues: p2 (ref), t (ref)
				local var11 = p5[p2]
				
				if var11 then
					local cloned = table.clone(p5)
					local cloned_1 = table.clone(var11)
					local var14 = if cloned_1.milestones then table.clone(cloned_1.milestones) else {}
					table.insert(var14, t)
					cloned_1.milestones = var14
					cloned[p2] = cloned_1
					
					return cloned
				end
				return p5
			end)
			
			return
		elseif fFlagTimeToInteractiveTrackerWarningsRequireDebugModule then
			if fFlagDebugTimeToInteractiveTrackerModule then
				name:warning(`called before trackStart for eventName={p2}`)
				
				return
			end
		else
			name:warning(`called before trackStart for eventName={p2}`)
		end
	end
end