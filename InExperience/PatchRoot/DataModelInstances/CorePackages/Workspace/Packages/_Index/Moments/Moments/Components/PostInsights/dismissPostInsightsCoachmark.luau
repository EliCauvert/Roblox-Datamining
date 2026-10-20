local FirePostInsightsCoachmarkEventModule = require(script.Parent.firePostInsightsCoachmarkEvent)
local PostInsightsCoachmarkImpressionCacheModule = require(script.Parent.postInsightsCoachmarkImpressionCache)
local EventNames = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Analytics.EventNames

return function()
	-- upvalues: PostInsightsCoachmarkImpressionCacheModule (copy), FirePostInsightsCoachmarkEventModule (copy), EventNames (copy)
	local Value: number = PostInsightsCoachmarkImpressionCacheModule.getValue()
	
	if Value < 0 then return end
	PostInsightsCoachmarkImpressionCacheModule.dismissValue()
	
	if Value > 0 then
		FirePostInsightsCoachmarkEventModule(EventNames.FTUXTooltipDismissed)
	end
end