local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local _ = require(TimeToInteractiveTracker.Stores.types)
local MergeTTIEventMetadataModule = require(TimeToInteractiveTracker.Utils.mergeTTIEventMetadata)
local GetMemoryMbModule = require(TimeToInteractiveTracker.Utils.getMemoryMb)
local FFlagTTITrackerMemoryTrackingModule = require(TimeToInteractiveTracker.Utils.FFlagTTITrackerMemoryTracking)

return function(p1, EndTime)
	-- upvalues: FFlagTTITrackerMemoryTrackingModule (copy), GetMemoryMbModule (copy), MergeTTIEventMetadataModule (copy)
	local ScaledEndTime = (EndTime - p1.startTime) * 1000
	local MemoryMbModule = if FFlagTTITrackerMemoryTrackingModule then GetMemoryMbModule() else nil
	
	return {
		statName = p1.statName,
		deltaMs = ScaledEndTime,
		metaData = MergeTTIEventMetadataModule(p1.metaData, {
			startTime = p1.startTime,
			endTime = EndTime,
			deltaMs = ScaledEndTime
		}),
		samplingRateOverride = p1.samplingRateOverride,
		milestones = p1.milestones,
		totalMemoryMB = if MemoryMbModule then MemoryMbModule.totalMemoryMB else nil,
		luaHeapMB = if MemoryMbModule then MemoryMbModule.luaHeapMB else nil
	}
end