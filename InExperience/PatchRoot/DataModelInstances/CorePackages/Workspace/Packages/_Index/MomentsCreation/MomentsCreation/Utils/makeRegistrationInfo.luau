local parent = script:FindFirstAncestor("MomentsCreation").Parent
local _ = require(parent.MomentsTypes)
local getFFlagMomentsStickerButton = require(parent.MomentsCommon).Flags.GetFFlagMomentsStickerButton
local _ = {
	PrimaryAsset = "PrimaryAsset",
	Music = "Music",
	Sticker = "Sticker"
}

return function(p0, p1) --[[ line: 36 | named "makeRegistrationInfo" ]]
	-- upvalues: getFFlagMomentsStickerButton (ref)
	local assetTotalDuration
	local edits = p1.edits
	local t = {}
	local _ = 0
	
	if edits and edits.trim then
		table.insert(t, {
			AssetId = 0,
			Description = "PrimaryAsset",
			TrimStartTime = edits.trim.startTime
		})
		assetTotalDuration = edits.trim.endTime - edits.trim.startTime
	else
		table.insert(t, {
			AssetId = 0,
			Description = "PrimaryAsset",
			TrimStartTime = 0
		})
		assetTotalDuration = p1.assetTotalDuration
	end
	if edits and edits.music then
		table.insert(t, {
			Description = "Music",
			AssetId = edits.music.assetId,
			TrimStartTime = edits.music.startTime
		})
	end
	if getFFlagMomentsStickerButton() and edits and edits.stickerOverlays then
		for i, v in edits.stickerOverlays do
			if v.stickerURI then
				table.insert(t, {
					AssetId = 0,
					Description = "Sticker",
					Text = v.stickerURI
				})
			end
		end
	end
	return {
		attributes = t,
		contentType = if p0.CaptureType == Enum.CaptureType.Screenshot then Enum.RecommendationItemContentType.Static else Enum.RecommendationItemContentType.Dynamic,
		customTags = {},
		duration = assetTotalDuration
	}
end