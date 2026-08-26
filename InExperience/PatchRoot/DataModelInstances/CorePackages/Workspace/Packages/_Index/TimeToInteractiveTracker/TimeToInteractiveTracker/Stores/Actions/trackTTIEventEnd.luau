local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local name = require(timeToInteractiveTracker.Logger):new(script.Name)
local _ = require(script.Parent.Parent.types)
local nowModule = require(script.Parent.Parent.Parent.Utils.now)
local sendTTIStatModule = require(timeToInteractiveTracker.Utils.sendTTIStat)
local mergeTTIEventMetadataModule = require(timeToInteractiveTracker.Utils.mergeTTIEventMetadata)
local utilModule = require(timeToInteractiveTracker.Utils.Util)
local getMemoryMbModule = require(timeToInteractiveTracker.Utils.getMemoryMb)
local fFlagTTITrackerMemoryTrackingModule = require(timeToInteractiveTracker.Utils.FFlagTTITrackerMemoryTracking)

return function(p1)
	-- upvalues: name (ref), nowModule (ref), mergeTTIEventMetadataModule (ref), utilModule (ref), fFlagTTITrackerMemoryTrackingModule (ref), getMemoryMbModule (ref), sendTTIStatModule (ref)
	return function(p2, p3)
		-- upvalues: p1 (ref), name (copy), nowModule (copy), mergeTTIEventMetadataModule (copy), utilModule (copy), fFlagTTITrackerMemoryTrackingModule (copy), getMemoryMbModule (copy), sendTTIStatModule (copy)
		local var1 = nil
		local var2 = nil
		local var3 = nil
		local var4 = false
		local var5 = if p3 and p3.cleanupAfterSend ~= nil then p3.cleanupAfterSend else true
		local var6 = if p3 then p3.samplingRateOverride else nil
		p1(function(p4)
			-- upvalues: p2 (ref), name (copy), nowModule (copy), var1 (write), var4 (write), var2 (write), mergeTTIEventMetadataModule (copy), var3 (write), var5 (ref), utilModule (copy)
			local var7 = p4[p2]
			
			if var7 == nil then
				name:warning(`called before trackStart for eventName={p2}`)
				
				return p4
			elseif var7.startTime == nil then
				name:warning(`called before trackStart for eventName={p2}`)
				
				return p4
			end
			local var8 = nowModule()
			var1 = (var8 - var7.startTime) * 1000
			var4 = var7.sent ~= true
			
			if var4 then
				var2 = mergeTTIEventMetadataModule(var7.metadata, {
					startTime = var7.startTime,
					endTime = var8,
					deltaMs = var1
				})
				
				if var7.milestones then
					var3 = var7.milestones
				end
			end
			local cloned = table.clone(p4)
			
			if var4 and var5 then
				cloned[p2] = nil
				
				return cloned
			end
			cloned[p2] = {
				sent = true,
				startTime = var7.startTime,
				endTime = var8,
				deltaMs = var1,
				metadata = table.clone(var7.metadata),
				milestones = if var7.milestones then utilModule.deepCloneMilestones(var7.milestones) else nil
			}
			
			return cloned
		end)
	end
end