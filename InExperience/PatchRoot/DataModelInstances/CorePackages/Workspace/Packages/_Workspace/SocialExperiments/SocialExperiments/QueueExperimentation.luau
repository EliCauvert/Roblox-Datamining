local ExperimentCacheManager = require(script:FindFirstAncestor("SocialExperiments").Parent.ExperimentCacheManager).ExperimentCacheManager
local FStringQueueExpLayer = game:DefineFastString("FStringQueueExpLayer", "Party.Coordination.ExperienceJoin")
local QueueEnableAutoJoinNewServerVariant = game:DefineFastString("QueueEnableAutoJoinNewServerVariant", "enableAutoJoinNewServer")
local QueueEnableJoinNewServerVariant = game:DefineFastString("QueueEnableJoinNewServerVariant", "enableJoinNewServerButton")
local ForceEnableQueueAutoJoinNewServer2 = game:DefineFastFlag("ForceEnableQueueAutoJoinNewServer2", false)
local ForceEnableQueueJoinNewServerButton2 = game:DefineFastFlag("ForceEnableQueueJoinNewServerButton2", false)
local PlaceJoinStateEnabledEngineFeature = game:DefineFastFlag("EnableQueueExperimentation2", false) and game:GetEngineFeature("PlaceJoinStateEnabled")

local function _(p1) --[[ Line: 17 | Named "getIsUserInTreatment" ]]
	-- upvalues: ExperimentCacheManager (copy), FStringQueueExpLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(FStringQueueExpLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getIsJoinNewServerButtonEnabled = function() --[[ Line: 32 ]]
		-- upvalues: ForceEnableQueueJoinNewServerButton2 (copy), PlaceJoinStateEnabledEngineFeature (copy), QueueEnableJoinNewServerVariant (copy), ExperimentCacheManager (copy), FStringQueueExpLayer (copy)
		local Flag: boolean = ForceEnableQueueJoinNewServerButton2
		
		if not Flag then
			Flag = PlaceJoinStateEnabledEngineFeature
			
			if Flag then
				local LayerVariables = ExperimentCacheManager.default:getLayerVariables(FStringQueueExpLayer)
				
				if LayerVariables and LayerVariables[QueueEnableJoinNewServerVariant] ~= nil then
					return LayerVariables[QueueEnableJoinNewServerVariant]
				end
				Flag = false
			end
		end
		return Flag
	end,
	getIsAutoJoinNewServerEnabled = function() --[[ Line: 27 ]]
		-- upvalues: ForceEnableQueueAutoJoinNewServer2 (copy), PlaceJoinStateEnabledEngineFeature (copy), QueueEnableAutoJoinNewServerVariant (copy), ExperimentCacheManager (copy), FStringQueueExpLayer (copy)
		local Flag: boolean = ForceEnableQueueAutoJoinNewServer2
		
		if not Flag then
			Flag = PlaceJoinStateEnabledEngineFeature
			
			if Flag then
				local LayerVariables = ExperimentCacheManager.default:getLayerVariables(FStringQueueExpLayer)
				
				if LayerVariables and LayerVariables[QueueEnableAutoJoinNewServerVariant] ~= nil then
					return LayerVariables[QueueEnableAutoJoinNewServerVariant]
				end
				Flag = false
			end
		end
		return Flag
	end,
	isInExperiment = function(): boolean --[[ Line: 37 ]]
		-- upvalues: PlaceJoinStateEnabledEngineFeature (copy), ExperimentCacheManager (copy), FStringQueueExpLayer (copy)
		return if PlaceJoinStateEnabledEngineFeature then ExperimentCacheManager.default:getLayerVariables(FStringQueueExpLayer) ~= nil else false
	end,
	logExposure = function() --[[ Line: 45 ]]
		-- upvalues: PlaceJoinStateEnabledEngineFeature (copy), ExperimentCacheManager (copy), FStringQueueExpLayer (copy)
		if PlaceJoinStateEnabledEngineFeature and ExperimentCacheManager.default:getLayerVariables(FStringQueueExpLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(FStringQueueExpLayer)
		end
	end
}