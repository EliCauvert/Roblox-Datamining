local Parent = script:FindFirstAncestor("Moments").Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)

return function(p1, Entry) --[[ Line: 33 | Named "makeJoinImpressionFields" ]]
	-- upvalues: MomentsCommonModule (copy)
	local RecommendationMetadata = p1.recommendationMetadata
	local FeedItemId = if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId
	
	if FeedItemId == nil or FeedItemId == "" then
		MomentsCommonModule.Analytics.reportMomentSkip("join_impression", if FeedItemId == nil then "nil" else "empty", { entry = Entry })
		
		return nil
	end
	local config = {
		surface = "feed_cta",
		feedItemId = FeedItemId,
		feedSessionId = RecommendationMetadata.tracingId or "",
		source = Entry
	}
	local UniverseId: number = p1.metadata.universeId
	
	if UniverseId ~= nil and UniverseId > 0 then
		config.destinationUniverseId = tostring(UniverseId)
	end
	return config
end