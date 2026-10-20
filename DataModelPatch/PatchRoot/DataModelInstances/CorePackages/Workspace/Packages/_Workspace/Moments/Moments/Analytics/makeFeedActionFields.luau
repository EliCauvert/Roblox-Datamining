local MomentsCommonModule = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)
local GetFFlagMomentsAnalyticsSchemaIdentityFunction = MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity

return function(MomentId, FeedItemId, p1, Action)
	-- upvalues: GetFFlagMomentsAnalyticsSchemaIdentityFunction (copy), MomentsCommonModule (copy)
	if not GetFFlagMomentsAnalyticsSchemaIdentityFunction() then
		return { momentId = MomentId }
	elseif FeedItemId == nil or FeedItemId == "" then
		MomentsCommonModule.Analytics.reportMomentSkip("feed_action", if FeedItemId == nil then "nil" else "empty", { action = Action })
		
		return nil
	else
		return {
			momentId = MomentId,
			feedItemId = FeedItemId,
			feedSessionId = p1 or ""
		}
	end
end