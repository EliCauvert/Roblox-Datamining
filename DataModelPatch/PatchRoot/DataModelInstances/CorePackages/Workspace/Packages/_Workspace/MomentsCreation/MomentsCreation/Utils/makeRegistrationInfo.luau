local _ = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsTypes)

return function(p1, p2)
	local Edits = p2.edits
	local List = {}
	local AssetTotalDuration = nil
	
	if Edits and Edits.trim then
		table.insert(List, {
			AssetId = 0,
			Description = "PrimaryAsset",
			TrimStartTime = Edits.trim.startTime
		})
		AssetTotalDuration = Edits.trim.endTime - Edits.trim.startTime
	else
		table.insert(List, {
			AssetId = 0,
			Description = "PrimaryAsset",
			TrimStartTime = 0
		})
		AssetTotalDuration = p2.assetTotalDuration
	end
	if Edits and Edits.music then
		table.insert(List, {
			Description = "Music",
			AssetId = Edits.music.assetId,
			TrimStartTime = Edits.music.startTime
		})
	end
	return {
		attributes = List,
		contentType = if p1.CaptureType == Enum.CaptureType.Screenshot then Enum.RecommendationItemContentType.Static else Enum.RecommendationItemContentType.Dynamic,
		customTags = {},
		duration = AssetTotalDuration
	}
end