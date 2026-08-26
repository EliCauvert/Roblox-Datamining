local momentsCommonModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.MomentsCommon)
local attributeType = momentsCommonModule.Enums.AttributeType
local getTagsForMoment = momentsCommonModule.Utils.getTagsForMoment

return function(p1, p2)
	-- upvalues: attributeType (ref), getTagsForMoment (ref)
	local assetTotalDuration
	local edits = p2.edits
	local t = {}
	local _ = 0
	
	if edits and edits.trim then
		table.insert(t, {
			AssetId = 0,
			Description = attributeType.PrimaryAsset,
			TrimStartTime = edits.trim.startTime
		})
		assetTotalDuration = edits.trim.endTime - edits.trim.startTime
	else
		table.insert(t, {
			AssetId = 0,
			TrimStartTime = 0,
			Description = attributeType.PrimaryAsset
		})
		assetTotalDuration = p2.assetTotalDuration
	end
	if edits and edits.music then
		table.insert(t, {
			AssetId = edits.music.assetId,
			Description = attributeType.Music,
			TrimStartTime = edits.music.startTime
		})
	end
	return {
		attributes = t,
		contentType = if p1.CaptureType == Enum.CaptureType.Screenshot then Enum.RecommendationItemContentType.Static else Enum.RecommendationItemContentType.Dynamic,
		customTags = getTagsForMoment(p2),
		duration = assetTotalDuration
	}
end