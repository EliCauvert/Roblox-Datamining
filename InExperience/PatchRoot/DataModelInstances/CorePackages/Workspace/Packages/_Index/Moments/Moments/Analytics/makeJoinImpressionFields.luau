local parent = script:FindFirstAncestor("Moments").Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)

return function(p1, p2)
	-- upvalues: momentsCommonModule (ref)
	local recommendationMetadata = p1.recommendationMetadata
	local var1 = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId
	
	if var1 == nil or var1 == "" then
		momentsCommonModule.Analytics.reportMomentSkip("join_impression", if var1 == nil then "nil" else "empty", { entry = p2 })
		
		return nil
	end
	local t = {
		surface = "feed_cta",
		feedItemId = var1,
		feedSessionId = recommendationMetadata.tracingId or "",
		source = p2
	}
	local universeId = p1.metadata.universeId
	
	if universeId ~= nil and universeId > 0 then
		t.destinationUniverseId = tostring(universeId)
	end
	return t
end