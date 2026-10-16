local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local FFlagMomentsImpressionDestinationUniverseIdModule = require(Moments.Flags.FFlagMomentsImpressionDestinationUniverseId)

return function(p1, Entry, ViewId) --[[ Line: 29 | Named "makeMomentViewBeganFields" ]]
	-- upvalues: MomentsCommonModule (copy), FFlagMomentsImpressionDestinationUniverseIdModule (copy)
	local RecommendationMetadata = p1.recommendationMetadata
	local FeedItemId = RecommendationMetadata.feedItemId
	
	if FeedItemId == nil or FeedItemId == "" then
		MomentsCommonModule.Analytics.reportMomentSkip("impression", if FeedItemId == nil then "nil" else "empty", { entry = Entry })
		
		return nil
	end
	local config = {
		viewMode = "vertical",
		momentId = p1.momentId,
		feedItemId = FeedItemId,
		feedSessionId = RecommendationMetadata.tracingId or "",
		source = Entry
	}
	local UniverseId: number = p1.metadata.universeId
	
	if FFlagMomentsImpressionDestinationUniverseIdModule and UniverseId ~= nil and UniverseId > 0 then
		config.destinationUniverseId = tostring(UniverseId)
	end
	if ViewId ~= nil then
		config.viewId = ViewId
	end
	return config
end