local Parent = script:FindFirstAncestor("Moments").Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local GetFFlagMomentsAnalyticsSchemaIdentityFunction = MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity

return function(p1, Entry)
	-- upvalues: GetFFlagMomentsAnalyticsSchemaIdentityFunction (copy), MomentsCommonModule (copy)
	local RecommendationMetadata = p1.recommendationMetadata
	
	if not GetFFlagMomentsAnalyticsSchemaIdentityFunction() then
		return {
			viewMode = "vertical",
			momentId = p1.momentId,
			itemId = RecommendationMetadata.itemId,
			tracingId = RecommendationMetadata.tracingId or ""
		}
	end
	local FeedItemId = RecommendationMetadata.feedItemId
	
	if FeedItemId == nil or FeedItemId == "" then
		MomentsCommonModule.Analytics.reportMomentSkip("impression", if FeedItemId == nil then "nil" else "empty", { entry = Entry })
		
		return nil
	else
		return {
			viewMode = "vertical",
			momentId = p1.momentId,
			feedItemId = FeedItemId,
			feedSessionId = RecommendationMetadata.tracingId or "",
			source = Entry
		}
	end
end