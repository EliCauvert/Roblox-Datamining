local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local _ = require(Parent.MomentsTypes)
local GetFFlagMomentsStickerButtonFunction = require(Parent.MomentsCommon).Flags.GetFFlagMomentsStickerButton

return function(p1, p2, p3) --[[ Line: 38 | Named "makeRegistrationInfo" ]]
	-- upvalues: GetFFlagMomentsStickerButtonFunction (copy)
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
	if GetFFlagMomentsStickerButtonFunction() and Edits and Edits.stickerOverlays then
		for _, stickerOverlay in Edits.stickerOverlays do
			if stickerOverlay.stickerURI then
				table.insert(List, {
					AssetId = 0,
					Description = "Sticker",
					Text = stickerOverlay.stickerURI
				})
			end
		end
	end
	return {
		attributes = List,
		contentType = if p1.CaptureType == Enum.CaptureType.Screenshot then Enum.RecommendationItemContentType.Static else Enum.RecommendationItemContentType.Dynamic,
		customTags = p3 or {},
		duration = AssetTotalDuration
	}
end