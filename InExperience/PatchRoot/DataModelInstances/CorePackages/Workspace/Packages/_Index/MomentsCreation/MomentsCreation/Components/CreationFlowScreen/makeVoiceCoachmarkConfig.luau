local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Parent.MomentsCommon)
local momentsTTSCoachmarkImpressionCacheModule = require(momentsCreation.Storage.MomentsTTSCoachmarkImpressionCache)

return function(p1, p2)
	-- upvalues: momentsTTSCoachmarkImpressionCacheModule (ref)
	return if p1 and p2 then {
		kind = "voice",
		titleKey = "Feature.Moments.Label.VoiceCoachmarkTitle",
		textKey = "Feature.Moments.Label.VoiceCoachmarkBody",
		impressionCache = momentsTTSCoachmarkImpressionCacheModule
	} else nil
end