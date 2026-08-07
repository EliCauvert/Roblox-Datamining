local experimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local fStringQueueExpLayer = game:DefineFastString("FStringQueueExpLayer", "Party.Coordination.ExperienceJoin")
local queueEnableAutoJoinNewServerVariant = game:DefineFastString("QueueEnableAutoJoinNewServerVariant", "enableAutoJoinNewServer")
local queueEnableJoinNewServerVariant = game:DefineFastString("QueueEnableJoinNewServerVariant", "enableJoinNewServerButton")
local forceEnableQueueAutoJoinNewServer2 = game:DefineFastFlag("ForceEnableQueueAutoJoinNewServer2", false)
local forceEnableQueueJoinNewServerButton2 = game:DefineFastFlag("ForceEnableQueueJoinNewServerButton2", false)
local placeJoinStateEnabled = game:DefineFastFlag("EnableQueueExperimentation2", false) and game:GetEngineFeature("PlaceJoinStateEnabled")

local function _(p0) --[[ line: 17 | named "getIsUserInTreatment" ]]
	-- upvalues: experimentCacheManager (ref), fStringQueueExpLayer (ref)
	local var6 = experimentCacheManager.default:getLayerVariables(fStringQueueExpLayer)
	
	return if var6 and var6[p0] ~= nil then var6[p0] else false
end

return {
	getIsJoinNewServerButtonEnabled = function() --[[ line: 32 ]]
		-- upvalues: forceEnableQueueJoinNewServerButton2 (ref), placeJoinStateEnabled (ref), queueEnableJoinNewServerVariant (ref), experimentCacheManager (ref), fStringQueueExpLayer (ref)
		local var7 = forceEnableQueueJoinNewServerButton2
		
		if not var7 then
			var7 = placeJoinStateEnabled
			
			if var7 then
				local var8 = queueEnableJoinNewServerVariant
				local var9 = experimentCacheManager.default:getLayerVariables(fStringQueueExpLayer)
				
				if var9 and var9[var8] ~= nil then
					return var9[var8]
				end
				var7 = false
			end
		end
		return var7
	end,
	getIsAutoJoinNewServerEnabled = function() --[[ line: 27 ]]
		-- upvalues: forceEnableQueueAutoJoinNewServer2 (ref), placeJoinStateEnabled (ref), queueEnableAutoJoinNewServerVariant (ref), experimentCacheManager (ref), fStringQueueExpLayer (ref)
		local var10 = forceEnableQueueAutoJoinNewServer2
		
		if not var10 then
			var10 = placeJoinStateEnabled
			
			if var10 then
				local var11 = queueEnableAutoJoinNewServerVariant
				local var12 = experimentCacheManager.default:getLayerVariables(fStringQueueExpLayer)
				
				if var12 and var12[var11] ~= nil then
					return var12[var11]
				end
				var10 = false
			end
		end
		return var10
	end,
	isInExperiment = function() --[[ line: 37 ]]
		-- upvalues: placeJoinStateEnabled (ref), experimentCacheManager (ref), fStringQueueExpLayer (ref)
		return if placeJoinStateEnabled then experimentCacheManager.default:getLayerVariables(fStringQueueExpLayer) ~= nil else false
	end,
	logExposure = function() --[[ line: 45 ]]
		-- upvalues: placeJoinStateEnabled (ref), experimentCacheManager (ref), fStringQueueExpLayer (ref)
		if placeJoinStateEnabled and experimentCacheManager.default:getLayerVariables(fStringQueueExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(fStringQueueExpLayer)
		end
	end
}