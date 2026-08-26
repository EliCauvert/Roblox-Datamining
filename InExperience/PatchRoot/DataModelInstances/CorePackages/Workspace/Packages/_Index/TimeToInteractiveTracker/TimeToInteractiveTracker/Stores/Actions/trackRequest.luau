local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local name = require(timeToInteractiveTracker.Logger):new(script.Name)
local fFlagDebugTimeToInteractiveTrackerModule = require(timeToInteractiveTracker.Utils.FFlagDebugTimeToInteractiveTracker)
local fFlagTimeToInteractiveTrackerWarningsRequireDebugModule = require(timeToInteractiveTracker.Utils.FFlagTimeToInteractiveTrackerWarningsRequireDebug)
local _ = require(script.Parent.Parent.types)
local nowModule = require(timeToInteractiveTracker.Utils.now)
local utilModule = require(timeToInteractiveTracker.Utils.Util)

return function(p1, p2)
	-- upvalues: nowModule (ref), fFlagTimeToInteractiveTrackerWarningsRequireDebugModule (ref), fFlagDebugTimeToInteractiveTrackerModule (ref), name (ref), utilModule (ref)
	return function(p3, p4, p5)
		-- upvalues: nowModule (copy), p1 (ref), fFlagTimeToInteractiveTrackerWarningsRequireDebugModule (copy), fFlagDebugTimeToInteractiveTrackerModule (copy), name (copy), p2 (ref), utilModule (copy)
		local var1 = nowModule()
		local var2 = p1(false)[p3]
		
		if var2 and var2.startTime then
			local t = {
				name = p5,
				timestamp = var1,
				deltaMs = (var1 - var2.startTime) * 1000
			}
			p2(function(p6)
				-- upvalues: p3 (ref), utilModule (copy), p4 (ref), fFlagTimeToInteractiveTrackerWarningsRequireDebugModule (copy), fFlagDebugTimeToInteractiveTrackerModule (copy), name (copy), t (ref)
				local var3 = p6[p3]
				
				if not var3 or not var3.milestones then
					return p6
				end
				local var4 = utilModule.findLastMilestoneIndex(var3.milestones, p4)
				
				if var4 then
					local cloned = table.clone(p6)
					local cloned_1 = table.clone(var3)
					local cloned_2 = table.clone(var3.milestones)
					local cloned_3 = table.clone(cloned_2[var4])
					local var5 = if cloned_3.requests then table.clone(cloned_3.requests) else {}
					table.insert(var5, t)
					cloned_3.requests = var5
					cloned_2[var4] = cloned_3
					cloned_1.milestones = cloned_2
					cloned[p3] = cloned_1
					
					return cloned
				elseif fFlagTimeToInteractiveTrackerWarningsRequireDebugModule then
					if fFlagDebugTimeToInteractiveTrackerModule then
						name:warning(`no milestone "{p3}" found for eventName={p3}`)
						
						return p6
					end
				else
					name:warning(`no milestone "{p3}" found for eventName={p3}`)
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