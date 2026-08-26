local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local fStringQueueExpLayer = game:DefineFastString("FStringQueueExpLayer", "Party.Coordination.ExperienceJoin")
local queueEnableAutoJoinNewServerVariant = game:DefineFastString("QueueEnableAutoJoinNewServerVariant", "enableAutoJoinNewServer")
local queueEnableJoinNewServerVariant = game:DefineFastString("QueueEnableJoinNewServerVariant", "enableJoinNewServerButton")
local forceEnableQueueAutoJoinNewServer2 = game:DefineFastFlag("ForceEnableQueueAutoJoinNewServer2", false)
local forceEnableQueueJoinNewServerButton2 = game:DefineFastFlag("ForceEnableQueueJoinNewServerButton2", false)
local placeJoinStateEnabled = game:DefineFastFlag("EnableQueueExperimentation2", false) and game:GetEngineFeature("PlaceJoinStateEnabled")

local function _(p1)
	-- upvalues: experimentCacheManager (ref), fStringQueueExpLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(fStringQueueExpLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getIsJoinNewServerButtonEnabled = function()
		-- upvalues: forceEnableQueueJoinNewServerButton2 (ref), placeJoinStateEnabled (ref), queueEnableJoinNewServerVariant (ref), experimentCacheManager (ref), fStringQueueExpLayer (ref)
		local var1 = forceEnableQueueJoinNewServerButton2
		
		if not var1 then
			var1 = placeJoinStateEnabled
			
			if var1 then
				local var2 = queueEnableJoinNewServerVariant
				local var3 = experimentCacheManager.default:getLayerVariables(fStringQueueExpLayer)
				
				if var3 and var3[var2] ~= nil then
					return var3[var2]
				end
				var1 = false
			end
		end
		return var1
	end,
	getIsAutoJoinNewServerEnabled = function()
		-- upvalues: forceEnableQueueAutoJoinNewServer2 (ref), placeJoinStateEnabled (ref), queueEnableAutoJoinNewServerVariant (ref), experimentCacheManager (ref), fStringQueueExpLayer (ref)
		local var1 = forceEnableQueueAutoJoinNewServer2
		
		if not var1 then
			var1 = placeJoinStateEnabled
			
			if var1 then
				local var2 = queueEnableAutoJoinNewServerVariant
				local var3 = experimentCacheManager.default:getLayerVariables(fStringQueueExpLayer)
				
				if var3 and var3[var2] ~= nil then
					return var3[var2]
				end
				var1 = false
			end
		end
		return var1
	end,
	isInExperiment = function()
		-- upvalues: placeJoinStateEnabled (ref), experimentCacheManager (ref), fStringQueueExpLayer (ref)
		return if placeJoinStateEnabled then experimentCacheManager.default:getLayerVariables(fStringQueueExpLayer) ~= nil else false
	end,
	logExposure = function()
		-- upvalues: placeJoinStateEnabled (ref), experimentCacheManager (ref), fStringQueueExpLayer (ref)
		if placeJoinStateEnabled and experimentCacheManager.default:getLayerVariables(fStringQueueExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(fStringQueueExpLayer)
		end
	end
}