local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local name = require(timeToInteractiveTracker.Logger):new(script.Name)
local fFlagDebugTimeToInteractiveTrackerModule = require(timeToInteractiveTracker.Utils.FFlagDebugTimeToInteractiveTracker)
local fFlagTimeToInteractiveTrackerWarningsRequireDebugModule = require(timeToInteractiveTracker.Utils.FFlagTimeToInteractiveTrackerWarningsRequireDebug)
local _ = require(script.Parent.Parent.types)
local nowModule = require(timeToInteractiveTracker.Utils.now)
local getMemoryMbModule = require(timeToInteractiveTracker.Utils.getMemoryMb)
local fFlagTTITrackerMemoryTrackingModule = require(timeToInteractiveTracker.Utils.FFlagTTITrackerMemoryTracking)

return function(p1, p2)
	-- upvalues: nowModule (ref), fFlagTimeToInteractiveTrackerWarningsRequireDebugModule (ref), fFlagDebugTimeToInteractiveTrackerModule (ref), name (ref), fFlagTTITrackerMemoryTrackingModule (ref), getMemoryMbModule (ref)
	return function(p3, p4, p5)
		-- upvalues: nowModule (copy), p1 (ref), fFlagTimeToInteractiveTrackerWarningsRequireDebugModule (copy), fFlagDebugTimeToInteractiveTrackerModule (copy), name (copy), fFlagTTITrackerMemoryTrackingModule (copy), getMemoryMbModule (copy), p2 (ref)
		local var1 = nowModule()
		local var2 = p1(false)[p3]
		
		if var2 and var2.startTime then
			local var3 = if fFlagTTITrackerMemoryTrackingModule then getMemoryMbModule() else nil
			local t = {
				name = p4,
				id = if p5 then p5.id else nil,
				timestamp = var1,
				deltaMs = (var1 - var2.startTime) * 1000,
				totalMemoryMB = if var3 then var3.totalMemoryMB else nil,
				luaHeapMB = if var3 then var3.luaHeapMB else nil
			}
			p2(function(p6)
				-- upvalues: p3 (ref), t (ref)
				local var4 = p6[p3]
				
				if var4 then
					local cloned = table.clone(p6)
					local cloned_1 = table.clone(var4)
					local var5 = if cloned_1.milestones then table.clone(cloned_1.milestones) else {}
					table.insert(var5, t)
					cloned_1.milestones = var5
					cloned[p3] = cloned_1
					
					return cloned
				end
				return p6
			end)
			
			return
		elseif fFlagTimeToInteractiveTrackerWarningsRequireDebugModule then
			if fFlagDebugTimeToInteractiveTrackerModule then
				name:warning(`called before trackStart for eventName={p3}`)
				
				return
			end
		else
			name:warning(`called before trackStart for eventName={p3}`)
		end
	end
end