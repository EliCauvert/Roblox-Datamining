local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local NewResult = require(TimeToInteractiveTracker.Logger):new(script.Name)
local FFlagLuaAppPerfTrackerUseLogger = require(TimeToInteractiveTracker.Parent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger
local FFlagDebugTimeToInteractiveTrackerModule = require(TimeToInteractiveTracker.Utils.FFlagDebugTimeToInteractiveTracker)
local FFlagTimeToInteractiveTrackerWarningsRequireDebugModule = require(TimeToInteractiveTracker.Utils.FFlagTimeToInteractiveTrackerWarningsRequireDebug)
local _ = require(script.Parent.Parent.types)
local NowModule = require(TimeToInteractiveTracker.Utils.now)
local UtilModule = require(TimeToInteractiveTracker.Utils.Util)

return function(Callback, Callback1)
	-- upvalues: NowModule (copy), FFlagLuaAppPerfTrackerUseLogger (copy), FFlagTimeToInteractiveTrackerWarningsRequireDebugModule (copy), FFlagDebugTimeToInteractiveTrackerModule (copy), NewResult (copy), UtilModule (copy)
	return function(p1, p2, Name)
		-- upvalues: NowModule (upval), Callback (copy), FFlagLuaAppPerfTrackerUseLogger (upval), FFlagTimeToInteractiveTrackerWarningsRequireDebugModule (upval), FFlagDebugTimeToInteractiveTrackerModule (upval), NewResult (upval), Callback1 (copy), UtilModule (upval)
		local NowModuleResult = NowModule()
		local CallbackResultEntry = Callback(false)[p1]
		
		if CallbackResultEntry and CallbackResultEntry.startTime then
			local config = {
				name = Name,
				timestamp = NowModuleResult,
				deltaMs = (NowModuleResult - CallbackResultEntry.startTime) * 1000
			}
			Callback1(function(Tbl)
				-- upvalues: p1 (copy), UtilModule (upval), p2 (copy), FFlagLuaAppPerfTrackerUseLogger (upval), FFlagTimeToInteractiveTrackerWarningsRequireDebugModule (upval), FFlagDebugTimeToInteractiveTrackerModule (upval), NewResult (upval), config (copy)
				local Entry = Tbl[p1]
				
				if not Entry or not Entry.milestones then
					return Tbl
				end
				local LastMilestoneIndex = UtilModule.findLastMilestoneIndex(Entry.milestones, p2)
				
				if LastMilestoneIndex then
					local Copy = table.clone(Tbl)
					local Copy1 = table.clone(Entry)
					local Copy2 = table.clone(Entry.milestones)
					local Copy3 = table.clone(Copy2[LastMilestoneIndex])
					local Copy4 = if Copy3.subphases then table.clone(Copy3.subphases) else {}
					table.insert(Copy4, config)
					Copy3.subphases = Copy4
					Copy2[LastMilestoneIndex] = Copy3
					Copy1.milestones = Copy2
					Copy[p1] = Copy1
					
					return Copy
				end
				if not FFlagLuaAppPerfTrackerUseLogger then
					if not FFlagTimeToInteractiveTrackerWarningsRequireDebugModule then
						warn(`TimeToInteractiveTracker.trackSubphase: no milestone "{p1}" found for eventName={p1}`)
					elseif FFlagDebugTimeToInteractiveTrackerModule then
						warn(`TimeToInteractiveTracker.trackSubphase: no milestone "{p1}" found for eventName={p1}`)
						
						return Tbl
					end
				elseif not FFlagTimeToInteractiveTrackerWarningsRequireDebugModule then
					NewResult:warning(`no milestone "{p1}" found for eventName={p1}`)
					
					return Tbl
				elseif FFlagDebugTimeToInteractiveTrackerModule then
					NewResult:warning(`no milestone "{p1}" found for eventName={p1}`)
					
					return Tbl
				end
				return Tbl
			end)
			
			return
		end
		if FFlagLuaAppPerfTrackerUseLogger then
			if not FFlagTimeToInteractiveTrackerWarningsRequireDebugModule then
				NewResult:warning(`called before trackStart for eventName={p1}`)
				
				return
			end
			if FFlagDebugTimeToInteractiveTrackerModule then
				NewResult:warning(`called before trackStart for eventName={p1}`)
				
				return
			end
		elseif not FFlagTimeToInteractiveTrackerWarningsRequireDebugModule then
			warn(`TimeToInteractiveTracker.trackSubphase called before trackStart for eventName={p1}`)
		elseif FFlagDebugTimeToInteractiveTrackerModule then
			warn(`TimeToInteractiveTracker.trackSubphase called before trackStart for eventName={p1}`)
			
			return
		end
	end
end