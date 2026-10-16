local Parent = script:FindFirstAncestor("SocialExperiments").Parent
local ExperimentCacheManager = require(Parent.ExperimentCacheManager).ExperimentCacheManager
local SharedFlagsModule = require(Parent.SharedFlags)
local FStringLuckyRecommendationExpLayer = game:DefineFastString("FStringLuckyRecommendationExpLayer", "Party.Coordination.ExperienceJoin3")
local LuckyRecommendationEnableVariant = game:DefineFastString("LuckyRecommendationEnableVariant", "enableLuckyRecommendation")
local FFlagForceEnableLuckyRecommendation = SharedFlagsModule.FFlagForceEnableLuckyRecommendation
local FFlagEnableLuckyRecommendationExperimentation = SharedFlagsModule.FFlagEnableLuckyRecommendationExperimentation

local function _(p1) --[[ Line: 15 | Named "getIsUserInTreatment" ]]
	-- upvalues: ExperimentCacheManager (copy), FStringLuckyRecommendationExpLayer (copy)
	local LayerVariables = ExperimentCacheManager.default:getLayerVariables(FStringLuckyRecommendationExpLayer)
	
	return if LayerVariables and LayerVariables[p1] ~= nil then LayerVariables[p1] else false
end

return {
	getLuckyRecommendationEnabled = function() --[[ Line: 25 ]]
		-- upvalues: FFlagForceEnableLuckyRecommendation (copy), FFlagEnableLuckyRecommendationExperimentation (copy), LuckyRecommendationEnableVariant (copy), ExperimentCacheManager (copy), FStringLuckyRecommendationExpLayer (copy)
		local FFlagForceEnableLuckyRecommendation1: boolean = FFlagForceEnableLuckyRecommendation
		
		if not FFlagForceEnableLuckyRecommendation1 then
			FFlagForceEnableLuckyRecommendation1 = FFlagEnableLuckyRecommendationExperimentation
			
			if FFlagForceEnableLuckyRecommendation1 then
				local LayerVariables = ExperimentCacheManager.default:getLayerVariables(FStringLuckyRecommendationExpLayer)
				
				if LayerVariables and LayerVariables[LuckyRecommendationEnableVariant] ~= nil then
					return LayerVariables[LuckyRecommendationEnableVariant]
				end
				FFlagForceEnableLuckyRecommendation1 = false
			end
		end
		return FFlagForceEnableLuckyRecommendation1
	end,
	logExposure = function() --[[ Line: 30 ]]
		-- upvalues: FFlagForceEnableLuckyRecommendation (copy), FFlagEnableLuckyRecommendationExperimentation (copy), ExperimentCacheManager (copy), FStringLuckyRecommendationExpLayer (copy)
		if not FFlagForceEnableLuckyRecommendation and FFlagEnableLuckyRecommendationExperimentation and ExperimentCacheManager.default:getLayerVariables(FStringLuckyRecommendationExpLayer) ~= nil then
			ExperimentCacheManager.default:logLayerExposure(FStringLuckyRecommendationExpLayer)
		end
	end
}