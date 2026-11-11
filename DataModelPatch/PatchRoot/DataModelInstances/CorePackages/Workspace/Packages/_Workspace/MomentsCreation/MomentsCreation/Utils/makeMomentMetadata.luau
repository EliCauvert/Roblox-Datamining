local _ = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsTypes)

return function(Sound, Description, Edits)
	return {
		assetTotalDuration = if Sound.CaptureType == Enum.CaptureType.Screenshot then 7 else Sound.TimeLength,
		captureType = Sound.CaptureType,
		description = Description,
		universeId = Sound.SourceUniverseId,
		placeId = Sound.SourcePlaceId,
		edits = Edits
	}
end