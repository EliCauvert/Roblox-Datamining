local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local fFlagMomentsImpressionDestinationUniverseIdModule = require(moments.Flags.FFlagMomentsImpressionDestinationUniverseId)
local getFFlagMomentsAnalyticsSchemaIdentity = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity

return function(p0, p1) --[[ line: 32 | named "makeMomentViewBeganFields" ]]
	-- upvalues: getFFlagMomentsAnalyticsSchemaIdentity (ref), momentsCommonModule (ref), fFlagMomentsImpressionDestinationUniverseIdModule (ref)
	local recommendationMetadata = p0.recommendationMetadata
	
	if not getFFlagMomentsAnalyticsSchemaIdentity() then
		return {
			viewMode = "vertical",
			momentId = p0.momentId,
			itemId = recommendationMetadata.feedItemId,
			tracingId = recommendationMetadata.tracingId or ""
		}
	end
	local feedItemId = recommendationMetadata.feedItemId
	
	if feedItemId == nil or feedItemId == "" then
		momentsCommonModule.Analytics.reportMomentSkip("impression", if feedItemId == nil then "nil" else "empty", { entry = p1 })
		
		return nil
	end
	local t = {
		viewMode = "vertical",
		momentId = p0.momentId,
		feedItemId = feedItemId,
		feedSessionId = recommendationMetadata.tracingId or "",
		source = p1
	}
	local universeId = p0.metadata.universeId
	
	if fFlagMomentsImpressionDestinationUniverseIdModule and universeId ~= nil and universeId > 0 then
		t.destinationUniverseId = tostring(universeId)
	end
	return t
end