local parent = script:FindFirstAncestor("SocialExperiments").Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local sharedFlagsModule = require(parent.SharedFlags)
local fStringLuckyRecommendationExpLayer = game:DefineFastString("FStringLuckyRecommendationExpLayer", "Party.Coordination.ExperienceJoin3")
local luckyRecommendationEnableVariant = game:DefineFastString("LuckyRecommendationEnableVariant", "enableLuckyRecommendation")
local fFlagForceEnableLuckyRecommendation = sharedFlagsModule.FFlagForceEnableLuckyRecommendation
local fFlagEnableLuckyRecommendationExperimentation = sharedFlagsModule.FFlagEnableLuckyRecommendationExperimentation

local function _(p0)
	-- upvalues: experimentCacheManager (ref), fStringLuckyRecommendationExpLayer (ref)
	local var3 = experimentCacheManager.default:getLayerVariables(fStringLuckyRecommendationExpLayer)
	
	return if var3 and var3[p0] ~= nil then var3[p0] else false
end

return {
	getLuckyRecommendationEnabled = function()
		-- upvalues: fFlagForceEnableLuckyRecommendation (ref), fFlagEnableLuckyRecommendationExperimentation (ref), luckyRecommendationEnableVariant (ref), experimentCacheManager (ref), fStringLuckyRecommendationExpLayer (ref)
		local var4 = fFlagForceEnableLuckyRecommendation
		
		if not var4 then
			var4 = fFlagEnableLuckyRecommendationExperimentation
			
			if var4 then
				local var5 = luckyRecommendationEnableVariant
				local var6 = experimentCacheManager.default:getLayerVariables(fStringLuckyRecommendationExpLayer)
				
				if var6 and var6[var5] ~= nil then
					return var6[var5]
				end
				var4 = false
			end
		end
		return var4
	end,
	logExposure = function()
		-- upvalues: fFlagForceEnableLuckyRecommendation (ref), fFlagEnableLuckyRecommendationExperimentation (ref), experimentCacheManager (ref), fStringLuckyRecommendationExpLayer (ref)
		if not fFlagForceEnableLuckyRecommendation and fFlagEnableLuckyRecommendationExperimentation and experimentCacheManager.default:getLayerVariables(fStringLuckyRecommendationExpLayer) ~= nil then
			experimentCacheManager.default:logLayerExposure(fStringLuckyRecommendationExpLayer)
		end
	end
}