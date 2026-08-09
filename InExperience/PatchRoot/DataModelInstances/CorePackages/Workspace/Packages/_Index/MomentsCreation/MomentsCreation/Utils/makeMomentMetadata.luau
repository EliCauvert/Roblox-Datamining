local _ = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsTypes)

return function(p0, p1, p2) --[[ line: 27 | named "makeMomentMetadata" ]]
	return {
		assetTotalDuration = if p0.CaptureType == Enum.CaptureType.Screenshot then 7 else p0.TimeLength,
		captureType = p0.CaptureType,
		description = p1,
		universeId = p0.SourceUniverseId,
		placeId = p0.SourcePlaceId,
		edits = p2
	}
end