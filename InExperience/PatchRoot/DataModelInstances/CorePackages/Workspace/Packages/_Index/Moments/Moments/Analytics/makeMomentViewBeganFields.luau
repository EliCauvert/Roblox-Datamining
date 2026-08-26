local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local fFlagMomentsImpressionDestinationUniverseIdModule = require(moments.Flags.FFlagMomentsImpressionDestinationUniverseId)
local getFFlagMomentsAnalyticsSchemaIdentity = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity

return function(p1, p2)
	-- upvalues: getFFlagMomentsAnalyticsSchemaIdentity (ref), momentsCommonModule (ref), fFlagMomentsImpressionDestinationUniverseIdModule (ref)
	local recommendationMetadata = p1.recommendationMetadata
	
	if not getFFlagMomentsAnalyticsSchemaIdentity() then
		return {
			viewMode = "vertical",
			momentId = p1.momentId,
			itemId = recommendationMetadata.feedItemId,
			tracingId = recommendationMetadata.tracingId or ""
		}
	end
	local feedItemId = recommendationMetadata.feedItemId
	
	if feedItemId == nil or feedItemId == "" then
		momentsCommonModule.Analytics.reportMomentSkip("impression", if feedItemId == nil then "nil" else "empty", { entry = p2 })
		
		return nil
	end
	local t = {
		viewMode = "vertical",
		momentId = p1.momentId,
		feedItemId = feedItemId,
		feedSessionId = recommendationMetadata.tracingId or "",
		source = p2
	}
	local universeId = p1.metadata.universeId
	
	if fFlagMomentsImpressionDestinationUniverseIdModule and universeId ~= nil and universeId > 0 then
		t.destinationUniverseId = tostring(universeId)
	end
	return t
end