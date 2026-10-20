local MomentsCommonModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.MomentsCommon)
local AttributeType = MomentsCommonModule.Enums.AttributeType
local GetTagsForMomentFunction = MomentsCommonModule.Utils.getTagsForMoment

return function(p1, p2)
	-- upvalues: AttributeType (copy), GetTagsForMomentFunction (copy)
	local Edits = p2.edits
	local List = {}
	local AssetTotalDuration = nil
	
	if Edits and Edits.trim then
		table.insert(List, {
			AssetId = 0,
			Description = AttributeType.PrimaryAsset,
			TrimStartTime = Edits.trim.startTime
		})
		AssetTotalDuration = Edits.trim.endTime - Edits.trim.startTime
	else
		table.insert(List, {
			AssetId = 0,
			TrimStartTime = 0,
			Description = AttributeType.PrimaryAsset
		})
		AssetTotalDuration = p2.assetTotalDuration
	end
	if Edits and Edits.music then
		table.insert(List, {
			AssetId = Edits.music.assetId,
			Description = AttributeType.Music,
			TrimStartTime = Edits.music.startTime
		})
	end
	return {
		attributes = List,
		contentType = if p1.CaptureType == Enum.CaptureType.Screenshot then Enum.RecommendationItemContentType.Static else Enum.RecommendationItemContentType.Dynamic,
		customTags = GetTagsForMomentFunction(p2),
		duration = AssetTotalDuration
	}
end