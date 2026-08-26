local momentsCommonModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.MomentsCommon)

return function(p1, p2, p3)
	-- upvalues: momentsCommonModule (ref)
	return {
		assetTotalDuration = if p1.CaptureType == Enum.CaptureType.Screenshot then momentsCommonModule.Constants.ScreenshotMusicDuration else p1.TimeLength,
		captureType = p1.CaptureType,
		description = p2,
		universeId = p1.SourceUniverseId,
		placeId = p1.SourcePlaceId,
		edits = p3
	}
end