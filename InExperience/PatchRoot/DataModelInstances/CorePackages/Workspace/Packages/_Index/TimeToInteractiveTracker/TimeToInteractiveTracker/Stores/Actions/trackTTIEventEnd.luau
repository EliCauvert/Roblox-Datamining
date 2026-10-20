local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local NewResult = require(TimeToInteractiveTracker.Logger):new(script.Name)
local _ = require(script.Parent.Parent.types)
local NowModule = require(script.Parent.Parent.Parent.Utils.now)
local SendTTIStatModule = require(TimeToInteractiveTracker.Utils.sendTTIStat)
local MergeTTIEventMetadataModule = require(TimeToInteractiveTracker.Utils.mergeTTIEventMetadata)
local UtilModule = require(TimeToInteractiveTracker.Utils.Util)
local GetMemoryMbModule = require(TimeToInteractiveTracker.Utils.getMemoryMb)
local FFlagTTITrackerMemoryTrackingModule = require(TimeToInteractiveTracker.Utils.FFlagTTITrackerMemoryTracking)

return function(Callback)
	-- upvalues: NewResult (copy), NowModule (copy), MergeTTIEventMetadataModule (copy), UtilModule (copy), FFlagTTITrackerMemoryTrackingModule (copy), GetMemoryMbModule (copy), SendTTIStatModule (copy)
	return function(StatName, p1)
		-- upvalues: Callback (copy), NewResult (upval), NowModule (upval), MergeTTIEventMetadataModule (upval), UtilModule (upval), FFlagTTITrackerMemoryTrackingModule (upval), GetMemoryMbModule (upval), SendTTIStatModule (upval)
		local ScaledStartTime = nil
		local MetaData = nil
		local Milestones = nil
		local IsNotSent = false
		local NoP1 = not p1 or p1.cleanupAfterSend == nil or p1.cleanupAfterSend
		local SamplingRateOverride = if p1 then p1.samplingRateOverride else nil
		Callback(function(Tbl)
			-- upvalues: StatName (copy), NewResult (upval), NowModule (upval), ScaledStartTime (ref), IsNotSent (ref), MetaData (ref), MergeTTIEventMetadataModule (upval), Milestones (ref), NoP1 (copy), UtilModule (upval)
			local Entry = Tbl[StatName]
			
			if Entry == nil then
				NewResult:warning(`called before trackStart for eventName={StatName}`)
				
				return Tbl
			end
			if Entry.startTime == nil then
				NewResult:warning(`called before trackStart for eventName={StatName}`)
				
				return Tbl
			end
			local NowModuleResult = NowModule()
			ScaledStartTime = (NowModuleResult - Entry.startTime) * 1000
			IsNotSent = Entry.sent ~= true
			
			if IsNotSent then
				MetaData = MergeTTIEventMetadataModule(Entry.metadata, {
					startTime = Entry.startTime,
					endTime = NowModuleResult,
					deltaMs = ScaledStartTime
				})
				
				if Entry.milestones then
					Milestones = Entry.milestones
				end
			end
			local Copy = table.clone(Tbl)
			
			if IsNotSent and NoP1 then
				Copy[StatName] = nil
				
				return Copy
			else
				Copy[StatName] = {
					sent = true,
					startTime = Entry.startTime,
					endTime = NowModuleResult,
					deltaMs = ScaledStartTime,
					metadata = table.clone(Entry.metadata),
					milestones = if Entry.milestones then UtilModule.deepCloneMilestones(Entry.milestones) else nil
				}
				
				return Copy
			end
		end)
		
		if IsNotSent and ScaledStartTime ~= nil and MetaData ~= nil then
			local MemoryMbModule = if FFlagTTITrackerMemoryTrackingModule then GetMemoryMbModule() else nil
			SendTTIStatModule({
				statName = StatName,
				deltaMs = ScaledStartTime,
				metaData = MetaData,
				samplingRateOverride = SamplingRateOverride,
				milestones = Milestones,
				totalMemoryMB = if MemoryMbModule then MemoryMbModule.totalMemoryMB else nil,
				luaHeapMB = if MemoryMbModule then MemoryMbModule.luaHeapMB else nil
			})
		end
	end
end