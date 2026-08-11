local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local name = require(timeToInteractiveTracker.Logger):new(script.Name)
local fFlagDebugTimeToInteractiveTrackerModule = require(timeToInteractiveTracker.Utils.FFlagDebugTimeToInteractiveTracker)
local fFlagTimeToInteractiveTrackerWarningsRequireDebugModule = require(timeToInteractiveTracker.Utils.FFlagTimeToInteractiveTrackerWarningsRequireDebug)
local _ = require(script.Parent.Parent.types)
local nowModule = require(timeToInteractiveTracker.Utils.now)
local utilModule = require(timeToInteractiveTracker.Utils.Util)

return function(p0, p1) --[[ line: 21 ]]
	-- upvalues: nowModule (ref), fFlagTimeToInteractiveTrackerWarningsRequireDebugModule (ref), fFlagDebugTimeToInteractiveTrackerModule (ref), name (ref), utilModule (ref)
	return function(p2, p3, p4) --[[ line: 22 ]]
		-- upvalues: nowModule (copy), p0 (ref), fFlagTimeToInteractiveTrackerWarningsRequireDebugModule (copy), fFlagDebugTimeToInteractiveTrackerModule (copy), name (copy), p1 (ref), utilModule (copy)
		local var6 = nowModule()
		local var7 = p0(false)[p2]
		
		if var7 and var7.startTime then
			local t = {
				name = p4,
				timestamp = var6,
				deltaMs = (var6 - var7.startTime) * 1000
			}
			p1(function(p5) --[[ line: 45 ]]
				-- upvalues: p2 (ref), utilModule (copy), p3 (ref), fFlagTimeToInteractiveTrackerWarningsRequireDebugModule (copy), fFlagDebugTimeToInteractiveTrackerModule (copy), name (copy), t (ref)
				local var9 = p5[p2]
				
				if not var9 or not var9.milestones then
					return p5
				end
				local var10 = utilModule.findLastMilestoneIndex(var9.milestones, p3)
				
				if var10 then
					local cloned = table.clone(p5)
					local cloned_1 = table.clone(var9)
					local cloned_2 = table.clone(var9.milestones)
					local cloned_3 = table.clone(cloned_2[var10])
					local var15 = if cloned_3.requests then table.clone(cloned_3.requests) else {}
					table.insert(var15, t)
					cloned_3.requests = var15
					cloned_2[var10] = cloned_3
					cloned_1.milestones = cloned_2
					cloned[p2] = cloned_1
					
					return cloned
				elseif fFlagTimeToInteractiveTrackerWarningsRequireDebugModule then
					if fFlagDebugTimeToInteractiveTrackerModule then
						name:warning(`no milestone "{p3}" found for eventName={p2}`)
						
						return p5
					end
				else
					name:warning(`no milestone "{p3}" found for eventName={p2}`)
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