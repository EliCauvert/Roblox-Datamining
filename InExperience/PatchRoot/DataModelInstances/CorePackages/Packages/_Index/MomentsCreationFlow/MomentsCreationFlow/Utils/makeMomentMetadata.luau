local momentsCommonModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.MomentsCommon)

return function(p0, p1, p2)
	-- upvalues: momentsCommonModule (ref)
	return {
		assetTotalDuration = if p0.CaptureType == Enum.CaptureType.Screenshot then momentsCommonModule.Constants.ScreenshotMusicDuration else p0.TimeLength,
		captureType = p0.CaptureType,
		description = p1,
		universeId = p0.SourceUniverseId,
		placeId = p0.SourcePlaceId,
		edits = p2
	}
end