local MomentsCommonModule = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon)

return function(MomentId, FeedItemId, p1, Action) --[[ Line: 31 | Named "makeFeedActionFields" ]]
	-- upvalues: MomentsCommonModule (copy)
	if FeedItemId == nil or FeedItemId == "" then
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