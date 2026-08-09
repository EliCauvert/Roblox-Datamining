local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local name = require(timeToInteractiveTracker.Logger):new(script.Name)
local fFlagLuaAppPerfTrackerUseLogger = require(timeToInteractiveTracker.Parent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger
local _ = require(script.Parent.Parent.types)
local nowModule = require(script.Parent.Parent.Parent.Utils.now)
local sendTTIStatModule = require(timeToInteractiveTracker.Utils.sendTTIStat)
local mergeTTIEventMetadataModule = require(timeToInteractiveTracker.Utils.mergeTTIEventMetadata)
local utilModule = require(timeToInteractiveTracker.Utils.Util)
local getMemoryMbModule = require(timeToInteractiveTracker.Utils.getMemoryMb)
local fFlagTTITrackerMemoryTrackingModule = require(timeToInteractiveTracker.Utils.FFlagTTITrackerMemoryTracking)

return function(p0) --[[ line: 24 ]]
	-- upvalues: fFlagLuaAppPerfTrackerUseLogger (ref), name (ref), nowModule (ref), fFlagTTITrackerMemoryTrackingModule (ref), mergeTTIEventMetadataModule (ref), utilModule (ref), getMemoryMbModule (ref), sendTTIStatModule (ref)
	return function(p1, p2) --[[ line: 25 ]]
		-- upvalues: p0 (ref), fFlagLuaAppPerfTrackerUseLogger (copy), name (copy), nowModule (copy), fFlagTTITrackerMemoryTrackingModule (copy), mergeTTIEventMetadataModule (copy), utilModule (copy), getMemoryMbModule (copy), sendTTIStatModule (copy)
		local var8 = nil
		local var9 = nil
		local var10 = nil
		local var11 = false
		local var12 = false
		local var13 = if p2 and p2.cleanupAfterSend ~= nil then p2.cleanupAfterSend else true
		local var14 = if p2 then p2.samplingRateOverride else nil
		p0(function(p3) --[[ line: 36 ]]
			-- upvalues: p1 (ref), fFlagLuaAppPerfTrackerUseLogger (copy), name (copy), nowModule (copy), var8 (write), var11 (write), var12 (write), fFlagTTITrackerMemoryTrackingModule (copy), var9 (write), mergeTTIEventMetadataModule (copy), var10 (write), var13 (ref), utilModule (copy)
			local var16 = p3[p1]
			
			if var16 == nil then
				if fFlagLuaAppPerfTrackerUseLogger then
					name:warning(`called before trackStart for eventName={p1}`)
					
					return p3
				end
				warn(`TimeToInteractiveTracker.trackEnd called before trackStart for eventName={p1}`)
				
				return p3
			elseif var16.startTime == nil then
				if fFlagLuaAppPerfTrackerUseLogger then
					name:warning(`called before trackStart for eventName={p1}`)
					
					return p3
				end
				warn(`TimeToInteractiveTracker.trackEnd called before trackStart for eventName={p1}`)
				
				return p3
			else
				local var17 = nowModule()
				var8 = (var17 - var16.startTime) * 1000
				var11 = var16.sent ~= true
				var12 = fFlagTTITrackerMemoryTrackingModule and var16.trackMemory == true
				
				if var11 then
					var9 = mergeTTIEventMetadataModule(var16.metadata, {
						startTime = var16.startTime,
						endTime = var17,
						deltaMs = var8
					})
					
					if var16.milestones then
						var10 = var16.milestones
					end
				end
				local cloned = table.clone(p3)
				
				if var11 and var13 then
					cloned[p1] = nil
					
					return cloned
				end
				cloned[p1] = {
					sent = true,
					startTime = var16.startTime,
					endTime = var17,
					deltaMs = var8,
					trackMemory = if fFlagTTITrackerMemoryTrackingModule then var16.trackMemory else nil,
					metadata = table.clone(var16.metadata),
					milestones = if var16.milestones then utilModule.deepCloneMilestones(var16.milestones) else nil
				}
				
				return cloned
			end
		end)
	end
end