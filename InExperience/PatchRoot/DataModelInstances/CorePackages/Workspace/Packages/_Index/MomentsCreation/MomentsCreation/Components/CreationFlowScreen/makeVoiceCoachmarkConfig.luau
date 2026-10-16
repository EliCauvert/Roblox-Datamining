local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(MomentsCreation.Parent.MomentsCommon)
local MomentsTTSCoachmarkImpressionCacheModule = require(MomentsCreation.Storage.MomentsTTSCoachmarkImpressionCache)

return function(p1, p2) --[[ Line: 21 | Named "makeVoiceCoachmarkConfig" ]]
	-- upvalues: MomentsTTSCoachmarkImpressionCacheModule (copy)
	return if p1 and p2 then {
		kind = "voice",
		titleKey = "Feature.Moments.Label.VoiceCoachmarkTitle",
		textKey = "Feature.Moments.Label.VoiceCoachmarkBody",
		impressionCache = MomentsTTSCoachmarkImpressionCacheModule
	} else nil
end