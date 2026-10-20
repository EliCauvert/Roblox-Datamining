local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local NewResult = require(TimeToInteractiveTracker.Logger):new(script.Name)
local FFlagLuaAppPerfTrackerUseLogger = require(TimeToInteractiveTracker.Parent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger
local FFlagDebugTimeToInteractiveTrackerModule = require(TimeToInteractiveTracker.Utils.FFlagDebugTimeToInteractiveTracker)
local FFlagTimeToInteractiveTrackerWarningsRequireDebugModule = require(TimeToInteractiveTracker.Utils.FFlagTimeToInteractiveTrackerWarningsRequireDebug)
local _ = require(script.Parent.Parent.types)
local NowModule = require(TimeToInteractiveTracker.Utils.now)
local GetMemoryMbModule = require(TimeToInteractiveTracker.Utils.getMemoryMb)
local FFlagTTITrackerMemoryTrackingModule = require(TimeToInteractiveTracker.Utils.FFlagTTITrackerMemoryTracking)

return function(Callback, Callback1)
	-- upvalues: NowModule (copy), FFlagLuaAppPerfTrackerUseLogger (copy), FFlagTimeToInteractiveTrackerWarningsRequireDebugModule (copy), FFlagDebugTimeToInteractiveTrackerModule (copy), NewResult (copy), FFlagTTITrackerMemoryTrackingModule (copy), GetMemoryMbModule (copy)
	return function(p1, Name, p2)
		-- upvalues: NowModule (upval), Callback (copy), FFlagLuaAppPerfTrackerUseLogger (upval), FFlagTimeToInteractiveTrackerWarningsRequireDebugModule (upval), FFlagDebugTimeToInteractiveTrackerModule (upval), NewResult (upval), FFlagTTITrackerMemoryTrackingModule (upval), GetMemoryMbModule (upval), Callback1 (copy)
		local NowModuleResult = NowModule()
		local CallbackResultEntry = Callback(false)[p1]
		
		if CallbackResultEntry and CallbackResultEntry.startTime then
			local MemoryMbModule = if FFlagTTITrackerMemoryTrackingModule then GetMemoryMbModule() else nil
			local config = {
				name = Name,
				id = if p2 then p2.id else nil,
				timestamp = NowModuleResult,
				deltaMs = (NowModuleResult - CallbackResultEntry.startTime) * 1000,
				totalMemoryMB = if MemoryMbModule then MemoryMbModule.totalMemoryMB else nil,
				luaHeapMB = if MemoryMbModule then MemoryMbModule.luaHeapMB else nil
			}
			Callback1(function(Tbl)
				-- upvalues: p1 (copy), config (copy)
				local Entry = Tbl[p1]
				
				if Entry then
					local Copy = table.clone(Tbl)
					local Copy1 = table.clone(Entry)
					local Copy2 = if Copy1.milestones then table.clone(Copy1.milestones) else {}
					table.insert(Copy2, config)
					Copy1.milestones = Copy2
					Copy[p1] = Copy1
					
					return Copy
				else
					return Tbl
				end
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
			warn(`TimeToInteractiveTracker.trackMilestone called before trackStart for eventName={p1}`)
		elseif FFlagDebugTimeToInteractiveTrackerModule then
			warn(`TimeToInteractiveTracker.trackMilestone called before trackStart for eventName={p1}`)
			
			return
		end
	end
end