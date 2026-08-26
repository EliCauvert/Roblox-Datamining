local parent = script:FindFirstAncestor("SocialExperiments").Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local sharedFlagsModule = require(parent.SharedFlags)
local fStringLuckyRecommendationExpLayer = game:DefineFastString("FStringLuckyRecommendationExpLayer", "Party.Coordination.ExperienceJoin3")
local luckyRecommendationEnableVariant = game:DefineFastString("LuckyRecommendationEnableVariant", "enableLuckyRecommendation")
local fFlagForceEnableLuckyRecommendation = sharedFlagsModule.FFlagForceEnableLuckyRecommendation
local fFlagEnableLuckyRecommendationExperimentation = sharedFlagsModule.FFlagEnableLuckyRecommendationExperimentation

local function _(p1)
	-- upvalues: experimentCacheManager (ref), fStringLuckyRecommendationExpLayer (ref)
	local var1 = experimentCacheManager.default:getLayerVariables(fStringLuckyRecommendationExpLayer)
	
	return if var1 and var1[p1] ~= nil then var1[p1] else false
end

return {
	getLuckyRecommendationEnabled = function()
		-- upvalues: fFlagForceEnableLuckyRecommendation (ref), fFlagEnableLuckyRecommendationExperimentation (ref), luckyRecommendationEnableVariant (ref), experimentCacheManager (ref), fStringLuckyRecommendationExpLayer (ref)
		local var1 = fFlagForceEnableLuckyRecommendation
		
		if not var1 then
			var1 = fFlagEnableLuckyRecommendationExperimentation
			
			if var1 then
				local var2 = luckyRecommendationEnableVariant
				local var3 = experimentCacheManager.default:getLayerVariables(fStringLuckyRecommendationExpLayer)
				
				if var3 and var3[var2] ~= nil then
					return var3[var2]
				end
				var1 = false
			end
		end
		return var1
	end,
	logExposure = function()
		-- upvalues: fFlagForceEnableLuckyRecommendation (ref), fFlagEnableLuckyRecommendationExperimentation (ref), experimentCacheManager (ref), fStringLuckyRecommendationExpLayer (ref)
		if not fFlagForceEnableLuckyRecommendation and fFlagEnableLuckyRecommendationExperimentation and experimentCacheManager.default:getLayerVariables(fStringLuckyRecommendationExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(fStringLuckyRecommendationExpLayer)
		end
	end
}