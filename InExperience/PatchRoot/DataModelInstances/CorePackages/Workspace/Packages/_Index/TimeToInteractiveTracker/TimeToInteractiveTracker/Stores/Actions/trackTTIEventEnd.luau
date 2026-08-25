local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local name = require(timeToInteractiveTracker.Logger):new(script.Name)
local _ = require(script.Parent.Parent.types)
local nowModule = require(script.Parent.Parent.Parent.Utils.now)
local sendTTIStatModule = require(timeToInteractiveTracker.Utils.sendTTIStat)
local mergeTTIEventMetadataModule = require(timeToInteractiveTracker.Utils.mergeTTIEventMetadata)
local utilModule = require(timeToInteractiveTracker.Utils.Util)
local getMemoryMbModule = require(timeToInteractiveTracker.Utils.getMemoryMb)
local fFlagTTITrackerMemoryTrackingModule = require(timeToInteractiveTracker.Utils.FFlagTTITrackerMemoryTracking)

return function(p0)
	-- upvalues: name (ref), nowModule (ref), mergeTTIEventMetadataModule (ref), utilModule (ref), fFlagTTITrackerMemoryTrackingModule (ref), getMemoryMbModule (ref), sendTTIStatModule (ref)
	return function(p1, p2)
		-- upvalues: p0 (ref), name (copy), nowModule (copy), mergeTTIEventMetadataModule (copy), utilModule (copy), fFlagTTITrackerMemoryTrackingModule (copy), getMemoryMbModule (copy), sendTTIStatModule (copy)
		local var8 = nil
		local var9 = nil
		local var10 = nil
		local var11 = false
		local var12 = if p2 and p2.cleanupAfterSend ~= nil then p2.cleanupAfterSend else true
		local var13 = if p2 then p2.samplingRateOverride else nil
		p0(function(p3)
			-- upvalues: p1 (ref), name (copy), nowModule (copy), var8 (write), var11 (write), var9 (write), mergeTTIEventMetadataModule (copy), var10 (write), var12 (ref), utilModule (copy)
			local var15 = p3[p1]
			
			if var15 == nil then
				name:warning(`called before trackStart for eventName={p1}`)
				
				return p3
			elseif var15.startTime == nil then
				name:warning(`called before trackStart for eventName={p1}`)
				
				return p3
			end
			local var16 = nowModule()
			var8 = (var16 - var15.startTime) * 1000
			var11 = var15.sent ~= true
			
			if var11 then
				var9 = mergeTTIEventMetadataModule(var15.metadata, {
					startTime = var15.startTime,
					endTime = var16,
					deltaMs = var8
				})
				
				if var15.milestones then
					var10 = var15.milestones
				end
			end
			local cloned = table.clone(p3)
			
			if var11 and var12 then
				cloned[p1] = nil
				
				return cloned
			end
			cloned[p1] = {
				sent = true,
				startTime = var15.startTime,
				endTime = var16,
				deltaMs = var8,
				metadata = table.clone(var15.metadata),
				milestones = if var15.milestones then utilModule.deepCloneMilestones(var15.milestones) else nil
			}
			
			return cloned
		end)
	end
end